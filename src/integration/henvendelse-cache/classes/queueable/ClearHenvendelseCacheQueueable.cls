public with sharing class ClearHenvendelseCacheQueueable implements Queueable {
    private Set<Id> conversationNoteIds;
    private String objectType;

    public ClearHenvendelseCacheQueueable(Set<Id> conversationNoteIds, String objectType){
        this.conversationNoteIds=conversationNoteIds;
        this.objectType=objectType;
    }
    
    public void execute(QueueableContext context) {
      
    }
}