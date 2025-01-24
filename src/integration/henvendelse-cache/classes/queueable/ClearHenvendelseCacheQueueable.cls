public with sharing class ClearHenvendelseCacheQueueable implements Queueable {
    private Set<Id> conversationNoteIds;

    public ClearHenvendelseCacheQueueable(Set<Id> conversationNoteIds){
        this.conversationNoteIds=conversationNoteIds;
    }
    
    public void execute(QueueableContext context) {
      
    }
}