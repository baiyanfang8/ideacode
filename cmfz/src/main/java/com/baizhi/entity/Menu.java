package com.baizhi.entity;

import java.util.List;

public class Menu {
    private String id;
    private String title;
    private String iconcls;
    private String href;
    private List<Menu> children;

    public Menu() {
    }

    public Menu(String id, String title, String iconcls, String href, List<Menu> children) {
        this.id = id;
        this.title = title;
        this.iconcls = iconcls;
        this.href = href;
        this.children = children;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIconcls() {
        return iconcls;
    }

    public void setIconcls(String iconcls) {
        this.iconcls = iconcls;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id='" + id + '\'' +
                ", name='" + title + '\'' +
                ", iconcls='" + iconcls + '\'' +
                ", href='" + href + '\'' +
                ", children=" + children +
                '}';
    }
}
