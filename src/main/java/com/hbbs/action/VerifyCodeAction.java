package com.hbbs.action;

import com.hbbs.util.VerifyCode;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import java.io.ByteArrayInputStream;

/**
 * Created by Hua on 2016/10/29.
 */
@ParentPackage("struts-default")
@Namespace("/")
@Action(
        value = "verifyCode",
        results = {
                @Result(type = "stream",params = {"contentType","image/jpeg","inputName","is","bufferSize","2048"})
        }
)
public class VerifyCodeAction extends ActionSupport {
    private ByteArrayInputStream is = null;

    public ByteArrayInputStream getIs() {
        return is;
    }

    public void setIs(ByteArrayInputStream is) {
        this.is = is;
    }

    @Override
    public String execute() throws Exception {
        String verifyCode = VerifyCode.getVerifyCode();
        ServletActionContext.getRequest().getSession().setAttribute("verifyCode",verifyCode);
        is = VerifyCode.getVerifyCodeImg(verifyCode);
        return SUCCESS;
    }
}
