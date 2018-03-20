package socketService;

import com.google.gson.Gson;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class SystemWebSocketHandler implements WebSocketHandler {

    private static ArrayList<WebSocketSession> users = new ArrayList<WebSocketSession>();
    private Map<String, String> userMaps = new HashMap<String, String>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("ConnectionEstablished");
        String i = session.getId();
        System.out.println(i + " user size:" + users.size());
        users.add(session);
    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        String messageFromClient = (String) message.getPayload();
        Gson gson = new Gson();
        NameViaScket bean = gson.fromJson(messageFromClient, NameViaScket.class);
//        System.out.println(bean.getUsername() + ": 아이디");
//        System.out.println(bean.getType() + ": 타입");
        String type = bean.getType();
        if (type.equals("0")) {
//            System.out.println(session.getId() + ": 세션아이디");
            if(!bean.getUsername().equals("justCallForList")) {
                userMaps.put(session.getId(), bean.getUsername());
            }
            sendtoAllOnlineUsers();
        } else if (type.equals("1")) {
            sendMessageToUsers(message);
        }
    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable throwable) throws Exception {
        if (session.isOpen()) {
            session.close();
        }
        removeUser(session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        removeUser(session);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    private void sendtoAllOnlineUsers() { // 현재 접속 중인 유저 전달
        // userMaps에 있는 모든 자료 새로운 Array 객체 username을 념거서
        // onlineMembers에 주입 후 json 파싱 후 이 객체를
        // 유저 전부에게 전달
        OnlineMembers onlineMembers = new OnlineMembers(); // 전송할 객체 { 타입, arraylist(유저이름들) } 로 구성
        ArrayList<String> username = new ArrayList<String>(); // 유저이름들 보관 객체

        for (Map.Entry<String, String> member : userMaps.entrySet()) {
            username.add(member.getValue());
        }
        onlineMembers.setType("3");
        onlineMembers.setUsernames(username);
        Gson gson = new Gson();
        String text = gson.toJson(onlineMembers);

        text = text.replace("\"3\"", "3");
        System.out.println(text);
        for (WebSocketSession user : users) {
            try {
                if (user.isOpen()) {
                    user.sendMessage(new TextMessage(text));
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void sendMessageToUsers(WebSocketMessage<?> message) {
        for (WebSocketSession user : users) {
            try {
                if (user.isOpen()) {
                    user.sendMessage(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void removeUser(WebSocketSession session) {
        users.remove(session);
        userMaps.remove(session.getId());
        sendtoAllOnlineUsers();
    }
}
