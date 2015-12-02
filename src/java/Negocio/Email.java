/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.swing.JOptionPane;

/**
 *
 * @author tomado de
 * http://www.forosdelweb.com/f45/enviar-correo-con-archivos-adjuntos-716775/
 */
public class Email {

    private String Username = "";
    private String PassWord = "";
    private String Mensage = "";
    private String To = "";
    private String Subject = "";

    public String SendMail() {
        String msg = "";
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.starttls.enable", "true");      
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(Username, PassWord);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(Username));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(To));
            message.setSubject(Subject);
            message.setText(Mensage);

            Transport.send(message);
            //JOptionPane.showMessageDialog(null, "Su mensaje ha sido enviado");
            msg = " Su mensaje ha sido enviado!!!";
            return msg;
        } catch (MessagingException e) {
            //throw new RuntimeException(e);
            msg = "Error Enviando Correo " + e.getMessage();
        }
        return msg;
    }

    public String SendMail3(String url) {
        String msg = "";
        try {
            String archivos_adjuntos = "C:/prueba" + url;
            String archivos_adjuntos_nombre = url;
            String patron = ";";
            String[] dividido_adj, dividido_adj_nom;
            dividido_adj = archivos_adjuntos.split(patron);
            dividido_adj_nom = archivos_adjuntos_nombre.split(patron);
            // se obtiene el objeto Session. La configuración es para 
            // una cuenta de gmail. 
            Properties props = new Properties();

            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", getUsername());
            props.setProperty("mail.smtp.auth", "true");

            Session session = Session.getDefaultInstance(props, null);
            // session.setDebug(true); 

            // Se compone la parte del texto 
            BodyPart texto = new MimeBodyPart();
            texto.setText(getMensage());
            List<BodyPart> bp = new LinkedList<BodyPart>();//<-------creamos una lista de adjuntos 
            // Se compone el adjunto con la imagen 

            for (int i = 0; i <= dividido_adj.length - 1; i++) {
                BodyPart adjunto = new MimeBodyPart();
                adjunto.setDataHandler(new DataHandler(new FileDataSource(dividido_adj[i])));
                adjunto.setFileName(dividido_adj_nom[i]);
                bp.add(adjunto);//<----------------añadimos el elemento a la lista 
            }

            // Una MultiParte para agrupar texto e imagen. 
            MimeMultipart multiParte = new MimeMultipart();
            multiParte.addBodyPart(texto);

            Iterator it = bp.iterator();//<------------la iteramos 
            while (it.hasNext())//<----------------la recorremos 
            {
                BodyPart attach = (BodyPart) it.next();//<------------obtenemos el objeto 
                multiParte.addBodyPart(attach);//<-----------------finalmente lo añadimos al mensaje 
            }

            // Se compone el correo, dando to, from, subject y el 
            // contenido. 
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(getUsername()));
            message.addRecipient(
                    Message.RecipientType.TO,
                    new InternetAddress(getTo()));
            message.setSubject(getSubject());
            message.setContent(multiParte);

            // Se envia el correo. 
            Transport t = session.getTransport("smtp");
            t.connect(getUsername(), getPassWord());
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            msg = "Su mensaje ha sido enviado Satisfactoriamente";
            return msg;
        } catch (Exception e) {
            //e.printStackTrace();
            msg = "Error Enviando Correo " + e.getMessage();
        }
        return msg;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassWord() {
        return PassWord;
    }

    public void setPassWord(String PassWord) {
        this.PassWord = PassWord;
    }

    public String getMensage() {
        return Mensage;
    }

    public void setMensage(String Mensage) {
        this.Mensage = Mensage;
    }

    public String getTo() {
        return To;
    }

    public void setTo(String To) {
        this.To = To;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }

}
