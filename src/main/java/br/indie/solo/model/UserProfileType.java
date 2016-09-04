package br.indie.solo.model;

public enum UserProfileType {

    USER("USER"),
    MANAGER("MANAGER"),
    ADMIN("ADMIN");

    String userProfileType;

    private UserProfileType(String userProfileType) {
        this.userProfileType = userProfileType;
    }

    public String getUserProfileType() {
        return userProfileType;
    }

}
