package com.hbbs.util;

import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Random;


public class VerifyCode {
	private static final int len = 4;
	private static final String verify = "asdfghjklqwertyuiopzxcvbnm1234567890";
	private static final int width = 100;
	private static final int height = 40;
	private static StringBuffer str;
	public static String getVerifyCode() {
		str = new StringBuffer();
		for(int i = 0;i < len;i++) {
			str.append(verify.charAt((int)(Math.random()*verify.length())));
		}
		return str.toString();
	}
	
	public static ByteArrayInputStream getVerifyCodeImg(String verifyStr) {
		BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = img.getGraphics();
		setBackGround(g);
		setBorder(g);
		drawRandomLine(g);
		drawRandomChar((Graphics2D) g, verifyStr);
		return convertImageToStream(img);
	}

	public static ByteArrayInputStream convertImageToStream(BufferedImage bufferedImage) {
		ByteArrayInputStream is = null;
		ByteOutputStream bos = new ByteOutputStream();
		JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(bos);
		try {
			jpeg.encode(bufferedImage);
			byte[] bts = bos.toByteArray();
			is = new ByteArrayInputStream(bts);
		} catch (ImageFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return is;
	}
	
	private static void setBackGround(Graphics g) {
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);
	}
	
	private static void setBorder(Graphics g) {
		g.setColor(Color.WHITE);
		g.drawRect(1, 1, width-2, height-2);
	}
	
	private static void drawRandomLine(Graphics g) {
		g.setColor(Color.GREEN);
		for(int i=0;i<5;i++) {
			int x1 = new Random().nextInt(width);
			int x2 = new Random().nextInt(width);
			int y1 = new Random().nextInt(height);
			int y2 = new Random().nextInt(height);
			g.drawLine(x1, y1, x2, y2);
		}
	}
	
	private static void drawRandomChar(Graphics2D g,String str) {
		int x = 5;
		g.setColor(Color.RED);
		g.setFont(new Font("黑体", Font.BOLD, 25));
		for(int i = 0;i < str.length();i++) {
			int degree = new Random().nextInt() % 30;
			g.rotate(degree * Math.PI / 180,x,20);
			g.drawString(str.charAt(i)+"", x, 20);
			g.rotate(-degree * Math.PI/180, x, 20);
			x += 25;
		}
	}
}
