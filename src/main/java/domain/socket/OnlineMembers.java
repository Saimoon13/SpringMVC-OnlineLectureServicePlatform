package domain.socket;

import java.util.ArrayList;

public class OnlineMembers {

    private String type;
    private ArrayList<String> usernames = new ArrayList<>();

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public ArrayList<String> getUsernames() {
        return usernames;
    }
    public void setUsernames(ArrayList<String> usernames) {
        this.usernames = usernames;
    }
}
