public with sharing class JokeCallout {
    public JokeCallout() {

    }

    public static void makeCallout() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://icanhazdadjoke.com/');
        req.setMethod('GET');
    }
}