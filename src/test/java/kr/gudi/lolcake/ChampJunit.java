package kr.gudi.lolcake;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import org.junit.Before;
import org.junit.FixMethodOrder;
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

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.gudi.lolcake.controller.ChampController;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
      "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ChampJunit {
   @Autowired // WebContext Bean 받아오기
   private WebApplicationContext wac;

   // MockMVC 변수 생성
   private MockMvc mock;

   HashMap<String, Object> param;
   int size = 138;
   int tot = 60;
   ModelAndView mav;

   @Autowired
   ChampController cc;

   HttpServletResponse resp = new HttpServletResponse() {
      
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
   
   @Before
   public void init() { // MockMVC 에게 WebContext 정보 받아 오기
      mock = MockMvcBuilders.webAppContextSetup(wac).build();
   }

   @Test
   public void champController() {
      mav = cc.champ(new ModelAndView());

      HashMap<String, Object> map = (HashMap<String, Object>) mav.getModel();
      System.out.println("map : " + map);
      System.out.println(mav);
      assertEquals(map, mav.getModel());
   }

   @Test
   public void champdataController() {
      ModelAndView view = cc.readData(new ModelAndView(), resp);
      HashMap<String, Object> map = (HashMap<String, Object>) view.getModel();
      String message = map.get("message").toString();

      JsonParser parser = new JsonParser();
      JsonElement element = parser.parse(message);

      JsonObject jobject = element.getAsJsonObject();
      JsonArray list = jobject.get("list").getAsJsonArray();
      assertEquals(size, list.size());

      System.out.println(list);
   }


   @Test
   public void champdetaildataController() throws Exception {
      String no = "120";
      mock.perform(post("/champDetailData") // get방식 : get("주소"), post방식 : post("주소")
            .param("no", no)) // paramater값 설정 : .param("key", "value")
            .andDo(new ResultHandler(){// 처리 내용을 출력합니다.
               @Override
               public void handle(MvcResult arg0) throws Exception {
                  ModelAndView mav = arg0.getModelAndView();
                  Map<String, Object> map = mav.getModel();
                  //System.out.println("map : " + map);

                  String message = map.get("message").toString();
                  //System.out.println("message : " + message);
                  JsonParser parser = new JsonParser();
                  JsonElement element = parser.parse(message);
                  try{
                     JsonObject jobject = element.getAsJsonObject();
                     JsonArray list = jobject.get("data").getAsJsonArray();
                     System.out.println("리스트 : " + list);

                     JsonObject ob = list.get(0).getAsJsonObject();
                     assertEquals(no, ob.get("no").getAsString());
                  }catch(NullPointerException e) {
                        fail("있는번호로 먹여야함(1~138)");
                     }   
                  }
                  
         });
   }

}