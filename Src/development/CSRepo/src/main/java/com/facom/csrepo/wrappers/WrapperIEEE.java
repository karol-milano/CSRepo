package com.facom.csrepo.wrappers;

import com.facom.csrepo.model.Author;
import com.facom.csrepo.model.Paper;
import com.facom.csrepo.model.dao.AuthorDao;
import com.facom.csrepo.model.dao.ConferenceDao;
import com.facom.csrepo.model.dao.PaperDao;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author Renato Gouvea
 */
public class WrapperIEEE {

    public WrapperIEEE() {
    }

    public static void main(String[] args) {
        update();
    }
    
    public static void update() {
        Calendar scheduleUpdate = Calendar.getInstance();
        scheduleUpdate.set(Calendar.MONTH, scheduleUpdate.get(Calendar.MONTH)+1);
        scheduleUpdate.set(Calendar.DAY_OF_MONTH, 1);
        scheduleUpdate.set(Calendar.HOUR, 0);
        scheduleUpdate.set(Calendar.MINUTE, 0);
        scheduleUpdate.set(Calendar.SECOND, 0);
        System.out.println(scheduleUpdate.getTime());
        Date data = scheduleUpdate.getTime();
        UpdateWrapper reminder = new UpdateWrapper(data);
        
            // method that returns papers from a searched conference
        NodeList papers = searchConference();

        // method that builds metadata for each paper
        buildMetadata(papers);
     }

    public static NodeList searchConference() {
        String search = "http://ieeexploreapi.ieee.org/api/v1/search/articles?publication_title="
                + "NAMEANDACRONYM&publication_year=YEAR&max_records=1000&format=xml&apikey=APIKEY";
        String name, acronym, year, apiKey;
        name = "\"International Conference on Software Engineering\"";
        acronym = "\"ICSE\"";
        year = "2017";
        apiKey = "xsgdpynaaxuxtwummncmbbxs";

        search = search.replaceAll("NAME", name);
        search = search.replaceAll("ACRONYM", acronym);
        search = search.replaceAll("YEAR", year);
        search = search.replaceAll("APIKEY", apiKey);
        search = search.replaceAll(" ", "%20");
        System.out.println(search);

        // search a conference in the IEE API and returns a string contents in Json format
        Document searchConference = getPapers(search);
        Element total = (Element) searchConference.getElementsByTagName("articles").item(0);
        // total of records returned from IEEE API
        System.out.println(total.getElementsByTagName("totalfound").item(0).getTextContent());
        NodeList papers = searchConference.getElementsByTagName("article");

        return papers;
    }

    public static void buildMetadata(NodeList papers) {
        //declarando atributos dos metadados de um paper
        Paper paper;
        String paperTitle, year;
        NodeList authors;
        List<Author> nameAuthor;
        int publicationYear, firstPage, lastPage, pages;
        int cont = 0;

        for (int i = 0; i < papers.getLength(); i++) {
            try {
                // each article returned from API
                Node node = papers.item(i);
                //if (node.getNodeType() == Node.ELEMENT_NODE){

                Element element = (Element) node;
                //get title
                paperTitle = element.getElementsByTagName("title").item(0).getTextContent();
                paperTitle = paperTitle.replaceAll("&#x0022;", "\"");
                //get pages
                firstPage = Integer.parseInt(element.getElementsByTagName("start_page").item(0).getTextContent());
                lastPage = Integer.parseInt(element.getElementsByTagName("end_page").item(0).getTextContent());
                pages = lastPage - firstPage + 1;
                //publication year
                String publicationTitle = (element.getElementsByTagName("publication_title").item(0).getTextContent());
                publicationYear = Integer.parseInt(publicationTitle.split(" ")[0]);
                //insert data on DB
                paper = new Paper(paperTitle, pages, publicationYear, firstPage, lastPage);
                ConferenceDao conference = new ConferenceDao();
//                //paper.setConference(conference.findById(200));
//                insertPaperDB(paper);

                //get authors
                authors = element.getElementsByTagName("authors");
                authors = ((Element) authors.item(0)).getElementsByTagName("author");
                nameAuthor = new ArrayList<>();
                for (int j = 0; j < authors.getLength(); j++) {
                    String name = ((Element) authors.item(j)).getElementsByTagName("full_name").item(0).getTextContent();
                    nameAuthor.add(new Author(name));
                    System.out.println("Authors: " + nameAuthor.get(j).getName());
                }
//                insertAuthorDB(nameAuthor);

            } catch (Exception e) {
            }
        }
    }

    public static void insertPaperDB(Paper paper) {
        PaperDao paperDao = new PaperDao();
        paperDao.insert(paper);
    }

    public static void insertAuthorDB(List<Author> authors) {
        AuthorDao dao = new AuthorDao();
        for (int i = 0; i < authors.size(); i++) {
            dao.insert(authors.get(i));
        }
    }

    public static Document getPapers(String uriStr) {
        try {
            URL url = new URL(uriStr);

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Accept", "application/xml");

            InputStream in = connection.getInputStream();

            DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            Document document = builder.parse(in);
            document.getDocumentElement().normalize();

            return document;
        } catch (MalformedURLException ex) {
            Logger.getLogger(WrapperIEEE.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(WrapperIEEE.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(WrapperIEEE.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SAXException ex) {
            Logger.getLogger(WrapperIEEE.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
