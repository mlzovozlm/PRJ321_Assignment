/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util.gui;

/**
 *
 * @author sonnt
 */
public class Pagger {

    private static String generateHyperlink(String content, String href) {
        return "<a class=\"pager_hyperlink\" href=\"" + href + "\">" + content + "</a>";
    }

    public static String generate(int totalPage, int pageIndex, int gap, String page) {
        String result = "";
        if (pageIndex > gap + 1) {
            result += generateHyperlink("First", page + "?page=1");
        }
        for (int i = pageIndex - gap; i < pageIndex; i++) {
            if (i > 0) {
                result += generateHyperlink("" + i, page + "?page=" + i);
            }
        }

        result += "<span class=\"pager_pageindex\">" + pageIndex + "</span>";

        for (int i = pageIndex + 1; i <= pageIndex + gap; i++) {
            if (i <= totalPage) {
                result += generateHyperlink("" + i, page + "?page=" + i);
            }
        }

        if (pageIndex < totalPage - gap) {
            result += generateHyperlink("Last", page + "?page=" + totalPage);
        }

        return result;
    }

}
