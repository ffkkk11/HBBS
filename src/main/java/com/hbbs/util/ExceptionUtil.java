package com.hbbs.util;


import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * Created by Hua on 2016/10/28.
 */
public class ExceptionUtil {
    private static final Logger logger = Logger.getLogger(ExceptionUtil.class);

    public static String getExceptionMessage(Exception ex) {
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ex.printStackTrace(pw);
        String errorMessage = sw.toString();
        pw.close();
        try {
            sw.close();
        } catch (IOException e) {
            logger.error(e);
        }
        return errorMessage;
    }
}
