global with sharing class ScheduleJokeCallout implements Schedulable {
    global void execute(SchedulableContext sc) {
        // Add your scheduled job logic here
        JokeCallout.makeCallout();
    }
    
    // Static method to schedule this class
    global static String scheduleJob() {
        // Schedule job to run every day at 2 AM
        // Change the CRON expression as per your requirement
        String jobId = System.schedule('Joke Scheduled', '0 0 16 * * ?', new ScheduleJokeCallout());
        return jobId;
    }
}
