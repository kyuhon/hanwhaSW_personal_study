package com.ohgiraffers.solid.dependencyInversion.resolved;

public class Application {
    public static void main(String[] args) {
        MessageSender emailSender = new EmailSender();           
        MessageSender smsSender = new SMSSender();
        
        NotificationSender emailService = new NotificationSender(emailSender);
        NotificationSender smsService = new NotificationSender(smsSender);
        
        emailService.sendNotification("이메일로 발송 될 공지");
        smsService.sendNotification("SMS로 발송 될 공지");
        
        
    }
}
