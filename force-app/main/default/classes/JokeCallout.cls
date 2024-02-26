public with sharing class JokeCallout {
    public JokeCallout() {

    }

    public static void makeCallout() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://icanhazdadjoke.com/');
        req.setMethod('GET');

        HttpResponse resp = http.send(req);
    }
}