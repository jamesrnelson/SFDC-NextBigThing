public with sharing class JokeCallout {
    public JokeCallout() {

    }

    public static void makeCallout() {
        try {
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://icanhazdadjoke.com/');
            req.setMethod('GET');
            req.setHeader('Accept', 'application/json');
    
            HttpResponse resp = http.send(req);
            JokeResponse joke = (JokeResponse)JSON.deserialize(resp.getBody(), JokeResponse.class);
            System.debug('joke:: '+ joke);
    
            if (joke.status == 200) {
                Joke__c jokeRecord = new Joke__c();
                jokeRecord.extId__c = joke.id;
                if (joke.joke.length() > 255) {
                    jokeRecord.Long_Joke__c = joke.joke;
                } else {
                    jokeRecord.Joke__c = joke.joke;
                }
                upsert jokeRecord jokeRecord.extId__c;
            }
        } catch(Exception e) {
            System.debug('Joke exception message:: ' + e.getMessage());
            System.debug('Joke exception stacktrace:: ' + e.getStackTraceString());
        }
    }

    public class JokeResponse {
        public Integer status;
        public String joke;
        public String id;
    }
}