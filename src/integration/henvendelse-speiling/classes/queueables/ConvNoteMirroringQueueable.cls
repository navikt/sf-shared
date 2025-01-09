public without sharing class ConvNoteMirroringQueueable implements Queueable, Database.AllowsCallouts {
    private static LoggerUtility logger = new LoggerUtility(
        'Henvendelse Mirroring'
    );
    private Set<Id> convNoteIds;

    public ConvNoteMirroringQueueable(Set<Id> convNoteIds) {
        this.convNoteIds = convNoteIds;
    }

    public void execute(QueueableContext context) {
        List<String> behandlingKjedeIds = ConvNoteSelector.getBehandlingskjedeIds(
            convNoteIds
        );

        List<Conversation_Note__c> convNotesBybehandlingKjedeIds = ConvNoteSelector.getConversationNotes(
            behandlingKjedeIds
        );

        List<CRM_Henvendelse> henvendelseList = convertToHenvendelseList(
            convNotesBybehandlingKjedeIds
        );

        if (henvendelseList.size() > 0) {
            HenvendelseMirroringService.postHenvendelser(
                henvendelseList,
                convNoteIds
            );
        } else {
            logger.error(
                'Unbale to find henvendelse' + convNoteIds.tostring(),
                null,
                CRM_ApplicationDomain.Domain.NKS
            );
            logger.publish();
        }
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
