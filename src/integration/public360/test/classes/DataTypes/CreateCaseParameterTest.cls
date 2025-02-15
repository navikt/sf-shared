/**
 * @description Test class for `CreateCaseParameter` data type.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, January 2025
 * @group Public 360 Integration
 * @see CreateCaseParameter
 */
@isTest
private class CreateCaseParameterTest {
    /**
     * @description Holds the initial create case parameter test data for the test class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see CreateCaseParameter
     */
    private static CreateCaseParameter initialCreateCaseParameterDataType;
    /**
     * @description Holds the initial create case parameter JSON string for the test class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
     * @since 0.1.0, February 2025
     * @see CreateCaseParameter
     */
    private static String initialJsonString;

    /**
     * @description Creates common test data for the test class.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     */
    private static void createTestData() {
        String adContextUser = 'adContextUser';
        String title = 'title';
        String unofficialTitle = 'unofficialTitle';
        ExternalIdParameter externalId = new ExternalIdParameter('1234');
        String startDate = P360Helper.getDatetimeFormatGMT(
            Datetime.now().addDays(-10)
        );
        String status = 'status';
        String closedDate = P360Helper.getDatetimeFormatGMT(Datetime.now());
        String journalUnit = 'journalUnit';
        String subArchive = 'subArchive';
        List<ArchiveCodeParameter> archiveCodes = new List<ArchiveCodeParameter>{
            new ArchiveCodeParameter('recno:60001', 1),
            new ArchiveCodeParameter('recno:60002', 2)
        };
        Boolean filedOnPaper = true;
        List<String> keywords = new List<String>{ 'keyword1', 'keyword2' };
        String accessCode = 'accessCode';
        String notes = 'notes';
        String caseType = 'caseType';
        String responsiblePersonIdNumber = '12345678900';
        String responsiblePersonRecno = 'recno:1234';
        String responsiblePersonEmail = 'test@test.nav.no';
        String responsiblePersonUserId = '12345678900';
        String responsibleEnterpriseNumber = '123456789';
        String responsibleEnterpriseRecno = 'recno:1234';
        List<ContactParameter> contacts = new List<ContactParameter>{
            new ContactParameter(responsiblePersonIdNumber, 'Sakspart'),
            new ContactParameter(responsiblePersonRecno, 'Sakspart')
        };
        List<UnregisteredContactsParameter> unregisteredContacts = new List<UnregisteredContactsParameter>{
            new UnregisteredContactsParameter('Test PersonOne', 'Sakspart'),
            new UnregisteredContactsParameter('Test PersonTwo', 'Sakspart')
        };
        List<String> referringCases = new List<String>{
            'referringCase1',
            'referringCase2'
        };
        String project = 'project';
        List<RemarkParameter> remarks = new List<RemarkParameter>{
            new RemarkParameter('remark1', 'remarkType1'),
            new RemarkParameter('remark2', 'remarkType2')
        };
        String scrapCode = 'scrapCode';
        String category = 'Category';
        List<EstateParameter> estates = new List<EstateParameter>{
            new EstateParameter('recno:1234', null),
            new EstateParameter(null, 'externalId1')
        };
        String defaultValueSet = 'defaultValueSet';
        String progressPlanId = 'ProgressPlanId';
        String eArchiveXMLFragment = 'eArchiveXMLFragment';
        String importedCaseNumber = 'importedCaseNumber';

        initialJsonString =
            '{"ADContextUser":"' +
            adContextUser +
            '","Title":"' +
            title +
            '","UnofficialTitle":"' +
            unofficialTitle +
            '","ExternalId":' +
            externalId.toJson() +
            ',"StartDate":"' +
            startDate +
            '","Status":"' +
            status +
            '","ClosedDate":"' +
            closedDate +
            '","JournalUnit":"' +
            journalUnit +
            '","SubArchive":"' +
            subArchive +
            '","ArchiveCodes":' +
            ArchiveCodeParameter.toJsonList(archiveCodes) +
            ',"FiledOnPaper":' +
            filedOnPaper +
            ',"Keywords":' +
            JSON.serialize(keywords) +
            ',"AccessCode":"' +
            accessCode +
            '","Notes":"' +
            notes +
            '","CaseType":"' +
            caseType +
            '","ResponsiblePersonIdNumber":"' +
            responsiblePersonIdNumber +
            '","ResponsiblePersonRecno":"' +
            responsiblePersonRecno +
            '","ResponsiblePersonEmail":"' +
            responsiblePersonEmail +
            '","ResponsiblePersonUserId":"' +
            responsiblePersonUserId +
            '","ResponsibleEnterpriseNumber":"' +
            responsibleEnterpriseNumber +
            '","ResponsibleEnterpriseRecno":"' +
            responsibleEnterpriseRecno +
            '","Contacts":' +
            ContactParameter.toJsonList(contacts) +
            ',"UnregisteredContacts":' +
            UnregisteredContactsParameter.toJsonList(unregisteredContacts) +
            ',"ReferringCases":' +
            JSON.serialize(referringCases) +
            ',"Project":"' +
            project +
            '","Remarks":' +
            RemarkParameter.toJsonList(remarks) +
            ',"ScrapCode":"' +
            scrapCode +
            '","Category":"' +
            category +
            '","Estates":' +
            EstateParameter.toJsonList(estates) +
            ',"DefaultValueSet":"' +
            defaultValueSet +
            '","ProgressPlanId":"' +
            progressPlanId +
            '","eArchiveXMLFragment":"' +
            eArchiveXMLFragment +
            '","ImportedCaseNumber":"' +
            importedCaseNumber +
            '"}';

        initialCreateCaseParameterDataType = new CreateCaseParameter();
        initialCreateCaseParameterDataType.AdContextUser = adContextUser;
        initialCreateCaseParameterDataType.Title = title;
        initialCreateCaseParameterDataType.UnofficialTitle = unofficialTitle;
        initialCreateCaseParameterDataType.ExternalId = externalId;
        initialCreateCaseParameterDataType.StartDate = (Datetime) JSON.deserialize(
            '"' + startDate + '"',
            Datetime.class
        );
        initialCreateCaseParameterDataType.Status = status;
        initialCreateCaseParameterDataType.ClosedDate = (Datetime) JSON.deserialize(
            '"' + closedDate + '"',
            Datetime.class
        );
        initialCreateCaseParameterDataType.JournalUnit = journalUnit;
        initialCreateCaseParameterDataType.SubArchive = subArchive;
        initialCreateCaseParameterDataType.ArchiveCodes = archiveCodes;
        initialCreateCaseParameterDataType.FiledOnPaper = filedOnPaper;
        initialCreateCaseParameterDataType.Keywords = keywords;
        initialCreateCaseParameterDataType.AccessCode = accessCode;
        initialCreateCaseParameterDataType.Notes = notes;
        initialCreateCaseParameterDataType.CaseType = caseType;
        initialCreateCaseParameterDataType.ResponsiblePersonIdNumber = responsiblePersonIdNumber;
        initialCreateCaseParameterDataType.ResponsiblePersonRecno = responsiblePersonRecno;
        initialCreateCaseParameterDataType.ResponsiblePersonEmail = responsiblePersonEmail;
        initialCreateCaseParameterDataType.ResponsiblePersonUserId = responsiblePersonUserId;
        initialCreateCaseParameterDataType.ResponsibleEnterpriseNumber = responsibleEnterpriseNumber;
        initialCreateCaseParameterDataType.ResponsibleEnterpriseRecno = responsibleEnterpriseRecno;
        initialCreateCaseParameterDataType.Contacts = contacts;
        initialCreateCaseParameterDataType.UnregisteredContacts = unregisteredContacts;
        initialCreateCaseParameterDataType.ReferringCases = referringCases;
        initialCreateCaseParameterDataType.Project = project;
        initialCreateCaseParameterDataType.Remarks = remarks;
        initialCreateCaseParameterDataType.ScrapCode = scrapCode;
        initialCreateCaseParameterDataType.Category = category;
        initialCreateCaseParameterDataType.Estates = estates;
        initialCreateCaseParameterDataType.DefaultValueSet = defaultValueSet;
        initialCreateCaseParameterDataType.ProgressPlanId = progressPlanId;
        initialCreateCaseParameterDataType.EArchiveXMLFragment = eArchiveXMLFragment;
        initialCreateCaseParameterDataType.ImportedCaseNumber = importedCaseNumber;
    }

    /**
     * @description Test `toJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, January 2025
     * @see CreateCaseParameter.toJson
     */
    @IsTest
    static void toJson() {
        CreateCaseParameterTest.createTestData();

        System.Test.startTest();
        String actualJsonString = initialCreateCaseParameterDataType.toJson();
        System.Test.stopTest();

        System.Assert.isTrue(
            JsonHelper.jsonEquals(initialJsonString, actualJsonString),
            'JSON strings are not equal'
        );
    }

    @IsTest
    static void fromJson() {
        CreateCaseParameterTest.createTestData();

        System.Test.startTest();
        CreateCaseParameter objectToSerialize = CreateCaseParameter.fromJson(
            initialJsonString
        );
        System.Test.stopTest();

        System.debug(JSON.serializePretty(objectToSerialize));

        System.Assert.areEqual(
            initialCreateCaseParameterDataType.AdContextUser,
            objectToSerialize.AdContextUser,
            'AdContextUser is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Title,
            objectToSerialize.Title,
            'Title is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.UnofficialTitle,
            objectToSerialize.UnofficialTitle,
            'UnofficialTitle is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ExternalId.toJson(),
            objectToSerialize.ExternalId.toJson(),
            'ExternalId is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.StartDate,
            objectToSerialize.StartDate,
            'StartDate is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Status,
            objectToSerialize.Status,
            'Status is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ClosedDate,
            objectToSerialize.ClosedDate,
            'ClosedDate is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.JournalUnit,
            objectToSerialize.JournalUnit,
            'JournalUnit is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.SubArchive,
            objectToSerialize.SubArchive,
            'SubArchive is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ArchiveCodes.size(),
            objectToSerialize.ArchiveCodes.size(),
            'ArchiveCodes size is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ArchiveCodes[0].toJson(),
            objectToSerialize.ArchiveCodes[0].toJson(),
            'ArchiveCodes[0] is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.FiledOnPaper,
            objectToSerialize.FiledOnPaper,
            'FiledOnPaper is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Keywords,
            objectToSerialize.Keywords,
            'Keywords is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.AccessCode,
            objectToSerialize.AccessCode,
            'AccessCode is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Notes,
            objectToSerialize.Notes,
            'Notes is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.CaseType,
            objectToSerialize.CaseType,
            'CaseType is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ResponsiblePersonIdNumber,
            objectToSerialize.ResponsiblePersonIdNumber,
            'ResponsiblePersonIdNumber is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ResponsiblePersonRecno,
            objectToSerialize.ResponsiblePersonRecno,
            'ResponsiblePersonRecno is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ResponsiblePersonEmail,
            objectToSerialize.ResponsiblePersonEmail,
            'ResponsiblePersonEmail is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ResponsiblePersonUserId,
            objectToSerialize.ResponsiblePersonUserId,
            'ResponsiblePersonUserId is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ResponsibleEnterpriseNumber,
            objectToSerialize.ResponsibleEnterpriseNumber,
            'ResponsibleEnterpriseNumber is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ResponsibleEnterpriseRecno,
            objectToSerialize.ResponsibleEnterpriseRecno,
            'ResponsibleEnterpriseRecno is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Contacts.size(),
            objectToSerialize.Contacts.size(),
            'Contacts size is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Contacts[0].toJson(),
            objectToSerialize.Contacts[0].toJson(),
            'Contacts[0] is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.UnregisteredContacts.size(),
            objectToSerialize.UnregisteredContacts.size(),
            'UnregisteredContacts size is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.UnregisteredContacts[0].toJson(),
            objectToSerialize.UnregisteredContacts[0].toJson(),
            'UnregisteredContacts[0] is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ReferringCases,
            objectToSerialize.ReferringCases,
            'ReferringCases is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Project,
            objectToSerialize.Project,
            'Project is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Remarks.size(),
            objectToSerialize.Remarks.size(),
            'Remarks size is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Remarks[0].toJson(),
            objectToSerialize.Remarks[0].toJson(),
            'Remarks[0] is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ScrapCode,
            objectToSerialize.ScrapCode,
            'ScrapCode is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Category,
            objectToSerialize.Category,
            'Category is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Estates.size(),
            objectToSerialize.Estates.size(),
            'Estates size is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.Estates[0].toJson(),
            objectToSerialize.Estates[0].toJson(),
            'Estates[0] is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.DefaultValueSet,
            objectToSerialize.DefaultValueSet,
            'DefaultValueSet is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ProgressPlanId,
            objectToSerialize.ProgressPlanId,
            'ProgressPlanId is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.EArchiveXMLFragment,
            objectToSerialize.EArchiveXMLFragment,
            'EArchiveXMLFragment is not equal'
        );
        System.Assert.areEqual(
            initialCreateCaseParameterDataType.ImportedCaseNumber,
            objectToSerialize.ImportedCaseNumber,
            'ImportedCaseNumber is not equal'
        );
    }

    /**
     * @description Test round trip of `CreateCaseParameter` data type.
     * Ensures that a `toJson()` -> `fromJson()` round-trip returns the same data.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see CreateCaseParameter.toJson
     * @see CreateCaseParameter.fromJson
     * */
    @IsTest
    static void roundTrip() {
        CreateCaseParameterTest.createTestData();

        Test.startTest();
        CreateCaseParameter objectToSerialize = CreateCaseParameter.fromJson(
            initialJsonString
        );
        String actualJsonString = objectToSerialize.toJson();
        Test.stopTest();

        System.Assert.isTrue(
            JsonHelper.jsonEquals(initialJsonString, actualJsonString),
            'JSON strings are not equal'
        );
    }
}
