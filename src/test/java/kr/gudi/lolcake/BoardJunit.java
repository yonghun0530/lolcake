package kr.gudi.lolcake;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUpgradeHandler;
import javax.servlet.http.Part;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultHandler;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import org.junit.Before;
import org.junit.FixMethodOrder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BoardJunit {
	
	@Autowired // WebContext Bean 받아오기
    private WebApplicationContext wac;
	
	// MockMVC 변수 생성
	private MockMvc mock;
	
	private int size = 10;
	private int tot = 49;
	ModelAndView mav = new ModelAndView();
	private HttpServletRequest req = new HttpServletRequest() {

		
		@Override
		public AsyncContext startAsync(ServletRequest arg0, ServletResponse arg1) throws IllegalStateException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public AsyncContext startAsync() throws IllegalStateException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public void setCharacterEncoding(String arg0) throws UnsupportedEncodingException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setAttribute(String arg0, Object arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void removeAttribute(String arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public boolean isSecure() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isAsyncSupported() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isAsyncStarted() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public ServletContext getServletContext() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getServerPort() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getServerName() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getScheme() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public RequestDispatcher getRequestDispatcher(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getRemotePort() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getRemoteHost() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRemoteAddr() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRealPath(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public BufferedReader getReader() throws IOException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getProtocol() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String[] getParameterValues(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration<String> getParameterNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Map<String, String[]> getParameterMap() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getParameter(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration<Locale> getLocales() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Locale getLocale() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getLocalPort() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getLocalName() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getLocalAddr() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public ServletInputStream getInputStream() throws IOException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public DispatcherType getDispatcherType() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getContentType() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public long getContentLengthLong() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public int getContentLength() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public String getCharacterEncoding() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration<String> getAttributeNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Object getAttribute(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public AsyncContext getAsyncContext() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public <T extends HttpUpgradeHandler> T upgrade(Class<T> arg0) throws IOException, ServletException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public void logout() throws ServletException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void login(String arg0, String arg1) throws ServletException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public boolean isUserInRole(String arg0) {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdValid() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdFromUrl() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdFromURL() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public boolean isRequestedSessionIdFromCookie() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public Principal getUserPrincipal() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public HttpSession getSession(boolean arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public HttpSession getSession() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getServletPath() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRequestedSessionId() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public StringBuffer getRequestURL() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRequestURI() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getRemoteUser() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getQueryString() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getPathTranslated() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getPathInfo() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Collection<Part> getParts() throws IOException, ServletException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Part getPart(String arg0) throws IOException, ServletException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getMethod() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getIntHeader(String arg0) {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Enumeration<String> getHeaders(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Enumeration<String> getHeaderNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getHeader(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public long getDateHeader(String arg0) {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Cookie[] getCookies() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getContextPath() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getAuthType() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String changeSessionId() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public boolean authenticate(HttpServletResponse arg0) throws IOException, ServletException {
			// TODO Auto-generated method stub
			return false;
		}
	};
	private String start = "0";
	private HttpServletResponse resp= new HttpServletResponse() {
		
		@Override
		public void setLocale(Locale arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setContentType(String arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setContentLengthLong(long arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setContentLength(int arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setCharacterEncoding(String arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setBufferSize(int arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void resetBuffer() {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void reset() {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public boolean isCommitted() {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public PrintWriter getWriter() throws IOException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public ServletOutputStream getOutputStream() throws IOException {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Locale getLocale() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getContentType() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getCharacterEncoding() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public int getBufferSize() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public void flushBuffer() throws IOException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setStatus(int arg0, String arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setStatus(int arg0) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setIntHeader(String arg0, int arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setHeader(String arg0, String arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void setDateHeader(String arg0, long arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void sendRedirect(String arg0) throws IOException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void sendError(int arg0, String arg1) throws IOException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void sendError(int arg0) throws IOException {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public int getStatus() {
			// TODO Auto-generated method stub
			return 0;
		}
		
		@Override
		public Collection<String> getHeaders(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public Collection<String> getHeaderNames() {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String getHeader(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String encodeUrl(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String encodeURL(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String encodeRedirectUrl(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public String encodeRedirectURL(String arg0) {
			// TODO Auto-generated method stub
			return null;
		}
		
		@Override
		public boolean containsHeader(String arg0) {
			// TODO Auto-generated method stub
			return false;
		}
		
		@Override
		public void addIntHeader(String arg0, int arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void addHeader(String arg0, String arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void addDateHeader(String arg0, long arg1) {
			// TODO Auto-generated method stub
			
		}
		
		@Override
		public void addCookie(Cookie arg0) {
			// TODO Auto-generated method stub
			
		}
	};
	private String viewRow = "10";
	private String type = "DATA";
	private String URI = "/allData";
	
	@Before
	public void init(){ // MockMVC 에게 WebContext 정보 받아 오기 
		mock = MockMvcBuilders.webAppContextSetup(wac).build();
	}
		
	@Test
	public void BoardTest() throws Exception {
		
		mock.perform(get(URI)           // get방식 : get("주소"), post방식 : post("주소") 
				 .param("start", "0") // paramater값 설정 : .param("key", "value")
	             .param("viewRow", "10")
	             .param("type", type))
		.andDo(new ResultHandler() {// 처리 내용을 출력합니다.
			@Override
			public void handle(MvcResult arg0) throws Exception {
				ModelAndView mav = arg0.getModelAndView();
				Map<String, Object> map = mav.getModel();
				System.out.println(map);
				
				String message = map.get("message").toString();
				System.out.println(message);
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(message);

				JsonObject jobject = element.getAsJsonObject(); 
				JsonArray list = jobject.get("list").getAsJsonArray();
				System.out.println(list);
				assertEquals(size, list.size());
				
/*				JsonObject totCnt = jobject.get("totCntall").getAsJsonObject();
				assertEquals(tot, Integer.parseInt(totCnt.get("tot").toString()));*/
			}
		})
		.andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
		.andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
		
	}
		
/*	@Test*/
	public void LikeTest() throws Exception {
		
		mock.perform(post("/like")           // get방식 : get("주소"), post방식 : post("주소") 
				 .param("no", "111")) // paramater값 설정 : .param("key", "value")
		.andDo(new ResultHandler() {// 처리 내용을 출력합니다.
			@Override
			public void handle(MvcResult arg0) throws Exception {
				ModelAndView mav = arg0.getModelAndView();
				Map<String, Object> map = mav.getModel();
				System.out.println(map);
				
				String message = map.get("message").toString();
//				System.out.println(message);
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(message);

				JsonObject jobject = element.getAsJsonObject(); 
				JsonElement str= jobject.get("bbslike");
				System.out.println("추천수 + "+str);
//				JsonArray list = jobject.get("bbslike").getAsJsonArray();
//				System.out.println(jobject);
				assertEquals("1", str.toString());
			}
		})
		.andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
		.andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
		
	}
/*	@Test*/
	public void HitTest() throws Exception {
		mock.perform(post("/hit")           // get방식 : get("주소"), post방식 : post("주소") 
				 .param("no", "106")) // paramater값 설정 : .param("key", "value")
		.andDo(new ResultHandler() {// 처리 내용을 출력합니다.
			@Override
			public void handle(MvcResult arg0) throws Exception {
				ModelAndView mav = arg0.getModelAndView();
				Map<String, Object> map = mav.getModel();
				System.out.println(map);
				
				String message = map.get("message").toString();
//				System.out.println(message);
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(message);
				JsonObject jobject = element.getAsJsonObject(); 
//				JsonArray list = jobject.get("bbshit").getAsJsonrray();
				JsonElement str = jobject.get("bbshit");
				System.out.println("조회수 + " +str);
//				System.out.println("조회수 " + jobject);
				assertEquals("1", str.toString());
			}
		})
		.andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
		.andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
	}
	
/*	@Test*/
	public void BoardDetailTest() throws Exception {
		
		mock.perform(get("/bbsData")           // get방식 : get("주소"), post방식 : post("주소") 
				 .param("no", "116")) // paramater값 설정 : .param("key", "value")
		.andDo(new ResultHandler() {// 처리 내용을 출력합니다.
			@Override
			public void handle(MvcResult arg0) throws Exception {
				ModelAndView mav = arg0.getModelAndView();
				Map<String, Object> map = mav.getModel();
				System.out.println(map);
				
				String message = map.get("message").toString();
//				System.out.println(message);
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(message);

				JsonObject jobject = element.getAsJsonObject(); 
//				JsonArray list = jobject.get("bbsD").getAsJsonArray();
				System.out.println(jobject);
//				assertEquals(size, list.size());
			}
		})
		.andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
		.andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
		
	}
	
	      
/*	   @Test*/
	   public void ReplyController() throws Exception {
		   int size = 10;
		   int tot = 7;
		   String boardno = "91";
		   String URI = "/replyD";
	      mock.perform(get(URI)           // get방식 : get("주소"), post방식 : post("주소") 
	             .param("no", boardno)) // paramater값 설정 : .param("key", "value")
	      .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
	         @Override
	         public void handle(MvcResult arg0) throws Exception {
	            ModelAndView mav = arg0.getModelAndView();
	            Map<String, Object> map = mav.getModel();
	            System.out.println(map);
	            
	            String message = map.get("message").toString();
	            System.out.println(message);
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(message);

	            JsonObject jobject = element.getAsJsonObject(); 
	            JsonArray list = jobject.get("replyD").getAsJsonArray();
	            System.out.println(list);
	            assertEquals(size, list.size());
	            
	         }
	      })
	      .andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
	      .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
	      
	   }
	   
/*	   @Test*/  //게시글삭제
	   public void BoardDeleteTest() throws Exception{
	      mock.perform(get("/Delete")           // get방식 : get("주소"), post방식 : post("주소") 
	                .param("no", "83")) // paramater값 설정 : .param("key", "value")
	         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
	            @Override
	            public void handle(MvcResult arg0) throws Exception {
	               ModelAndView mav = arg0.getModelAndView();
	               Map<String, Object> map = mav.getModel();
	               System.out.println(map);
	               
	               String message = map.get("message").toString();
	               JsonParser parser = new JsonParser();
	               JsonElement element = parser.parse(message);
	               JsonObject jobject = element.getAsJsonObject(); 
	               JsonElement val = jobject.get("delete");
	               System.out.println(val);
	               assertEquals("1", val.toString());
	            }
	         })
	         .andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
	         .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
	   }
	   
/*	   @Test*/  //게시글수정
	   public void BoardUpdateTest() throws Exception{
	      mock.perform(get("/editData")           // get방식 : get("주소"), post방식 : post("주소") 
	                .param("type", "MOVIE")
	                .param("title", "ddddd")
	                .param("dept", "test")
	                .param("url", "https://www.youtube.com/watch?v=oWiR9Ojn7JY")
	                .param("no", "83"))
	         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
	            @Override
	            public void handle(MvcResult arg0) throws Exception {
	               ModelAndView mav = arg0.getModelAndView();
	               Map<String, Object> map = mav.getModel();
	               System.out.println(map);
	               
	               String message = map.get("message").toString();
	               JsonParser parser = new JsonParser();
	               JsonElement element = parser.parse(message);
	               JsonObject jobject = element.getAsJsonObject(); 
	               JsonElement val = jobject.get("list");
	               System.out.println(val);
	               assertEquals("1", val.toString());
	            }
	         })
	         .andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
	         .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
	   }
	   
/*	   @Test*/  //게시글쓰기
	   public void BoardWriteTest() throws Exception{
	      mock.perform(get("/writeData")           // get방식 : get("주소"), post방식 : post("주소") 
	                .param("type", "FREE")
	                .param("title", "WriteTest")
	                .param("contents", "test")
	                .param("nickname", "Junit")
	                .param("passwd", "1234")
	                .param("hit", "0")
	                .param("like", "0")
	                .param("del_yn", "N")
	                .param("url", "http://"))
	         .andDo(new ResultHandler() {// 처리 내용을 출력합니다.
	            @Override
	            public void handle(MvcResult arg0) throws Exception {
	               ModelAndView mav = arg0.getModelAndView();
	               Map<String, Object> map = mav.getModel();
	               System.out.println(map);
	               
	               String message = map.get("message").toString();
	               JsonParser parser = new JsonParser();
	               JsonElement element = parser.parse(message);
	               JsonObject jobject = element.getAsJsonObject(); 
	               JsonElement val = jobject.get("list");
	               System.out.println(val);
	               assertEquals("1", val.toString());
	            }
	         })
	         .andExpect(status().isOk())// 상태값은 OK가 나와야 합니다.
	         .andExpect(model().attributeExists("message"));// "message"이라는 attribute가 존재해야 합니다.
	   }
}
