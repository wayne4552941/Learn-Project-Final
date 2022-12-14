package fourth.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "log")
public class Log implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Log() {
		// TODO Auto-generated constructor stub
	}
		@Id
		@Column(name = "logid")
		private String logId;           //日志主键  
	    private String type;            //日志类型  
	    private String title;           //日志标题  
	    
	    @Column(name = "remoteaddr")
	    private String remoteAddr;          //请求地址  
	    
	    @Column(name = "requesturi")
	    private String requestUri;          //URI   
	    private String method;          //请求方式  
	    private String params;          //提交参数  
	    private String exception;           //异常    
	    
	    @Column(name = "operatedate")
	    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	    private Date operateDate;           //开始时间  
	    private String timeout;         //结束时间  
	    
	    @Transient
	    private String userId;          //用户ID  

	    @ManyToOne
	    @JoinColumn(name = "userid")
	    private MemberBean memberBean;
	    
	    
	    public String getLogId() {
	        return StringUtils.isBlank(logId) ? logId : logId.trim();
	    }
	    public void setLogId(String logId) {
	        this.logId = logId;
	    }


	    public String getType() {
	        return StringUtils.isBlank(type) ? type : type.trim();
	    }
	    public void setType(String type) {
	        this.type = type;
	    }


	    public String getTitle() {
	        return StringUtils.isBlank(title) ? title : title.trim();
	    }
	    public void setTitle(String title) {
	        this.title = title;
	    }


	    public String getRemoteAddr() {
	        return StringUtils.isBlank(remoteAddr) ? remoteAddr : remoteAddr.trim();
	    }
	    public void setRemoteAddr(String remoteAddr) {
	        this.remoteAddr = remoteAddr;
	    }


	    public String getRequestUri() {
	        return StringUtils.isBlank(requestUri) ? requestUri : requestUri.trim();
	    }
	    public void setRequestUri(String requestUri) {
	        this.requestUri = requestUri;
	    }


	    public String getMethod() {
	        return StringUtils.isBlank(method) ? method : method.trim();
	    }
	    public void setMethod(String method) {
	        this.method = method;
	    }


	    public String getParams() {
	        return StringUtils.isBlank(params) ? params : params.trim();
	    }
	    public void setParams(String params) {
	        this.params = params;
	    }

	    /**
	     * 设置请求参数
	     * @param paramMap
	     */
	    public void setMapToParams(Map<String, String[]> paramMap) {
	        if (paramMap == null){
	            return;
	        }
	        StringBuilder params = new StringBuilder();
	        for (Map.Entry<String, String[]> param : ((Map<String, String[]>)paramMap).entrySet()){
	            params.append(("".equals(params.toString()) ? "" : "&") + param.getKey() + "=");
	            String paramValue = (param.getValue() != null && param.getValue().length > 0 ? param.getValue()[0] : "");
	            params.append(StringUtils.abbreviate(StringUtils.endsWithIgnoreCase(param.getKey(), "password") ? "" : paramValue, 100));
	        }
	        this.params = params.toString();
	    }


	    public String getException() {
	        return StringUtils.isBlank(exception) ? exception : exception.trim();
	    }
	    public void setException(String exception) {
	        this.exception = exception;
	    }


	    public Date getOperateDate() {
	        return operateDate;
	    }
	    public void setOperateDate(Date operateDate) {
	        this.operateDate = operateDate;
	    }


	    public String getTimeout() {
	        return StringUtils.isBlank(timeout) ? timeout : timeout.trim();
	    }
	    public void setTimeout(String timeout) {
	        this.timeout = timeout;
	    }


	    public String getUserId() {
	        return StringUtils.isBlank(userId) ? userId : userId.trim();
	    }
	    public void setUserId(String userId) {
	        this.userId = userId;
	    }
	    
	    
	    
		public MemberBean getMemberBean() {
			return memberBean;
		}
		public void setMemberBean(MemberBean memberBean) {
			this.memberBean = memberBean;
		}
		
		@Override
		public String toString() {
			return "Log [logId=" + logId + ", type=" + type + ", title=" + title + ", remoteAddr=" + remoteAddr
					+ ", requestUri=" + requestUri + ", method=" + method + ", params=" + params + ", exception="
					+ exception + ", operateDate=" + operateDate + ", timeout=" + timeout + ", memberBean=" + memberBean
					+ "]";
		}
		
	    
}
