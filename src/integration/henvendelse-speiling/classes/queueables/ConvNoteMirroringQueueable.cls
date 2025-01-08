public without sharing class ConvNoteMirroringQueueable implements Queueable {
    private Set<Id> convNoteIds;

    public ConvNoteMirroringQueueable(Set<Id> convNoteIds) {
        this.convNoteIds = convNoteIds;
    }

    public void execute(QueueableContext context) {
        List<String> behandlingKjedeIds = ConvNoteRepository.getBehandlingskjedeIds(
            convNoteIds
        );
        List<Conversation_Note__c> convNotesBybehandlingKjedeIds = ConvNoteRepository.getConversationNotes(
            behandlingKjedeIds
        );
        List<CRM_Henvendelse> henvendelseList = convertToHenvendelseList(
            convNotesBybehandlingKjedeIds
        );
    }

    private List<CRM_Henvendelse> convertToHenvendelseList(
        List<Conversation_Note__c> convNoteList
    ) {
        Map<String, List<Conversation_Note__c>> convNoteMap = new Map<String, List<Conversation_Note__c>>(); //Mapping behandlingskjedeId to a list of conversation notes
        for (Conversation_Note__c convNote : convNoteList) {
            String behandlingskjedeId = convNote.CRM_Henvendelse_BehandlingskjedeId__c;
            if (convNoteMap.containsKey(behandlingskjedeId)) {
                List<Conversation_Note__c> tempNotes = convNoteMap.get(
                    behandlingskjedeId
                );
                tempNotes.add(convNote);
                convNoteMap.put(behandlingskjedeId, tempNotes);
            } else {
                convNoteMap.put(
                    behandlingskjedeId,
                    new List<Conversation_Note__c>{ convNote }
                );
            }
        }
        List<CRM_Henvendelse> retList = new List<CRM_Henvendelse>();
        for (List<Conversation_Note__c> noteList : convNoteMap.values()) {
            retList.add(new CRM_Henvendelse(noteList));
        }

        return retList;
    }
}
