/**
 * @description Test class for `GetCasesQuery` class.
 *
 * @author Kenneth Soerensen <kenneth.sorensen@nav.com>, Nav
 * @since 0.1.0, February 2025
 * @group Public 360 Integration
 * @see GetCasesQuery
 */
@isTest(IsParallel=true)
private class GetCasesQueryTest {
    /**
     * @description Test `constructor` with no parameters.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see GetCasesQuery
     */
    @IsTest
    static void constructorEmpty() {
        GetCasesQuery getCasesQuery;

        System.Test.startTest();
        getCasesQuery = new GetCasesQuery();
        System.Test.stopTest();

        System.Assert.isNull(
            getCasesQuery.ADContextUser,
            'ADContextUser should be null'
        );
        System.Assert.isNull(
            getCasesQuery.MaxReturnedCases,
            'MaxReturnedCases should be null'
        );
        System.Assert.isNull(getCasesQuery.Page, 'Page should be null');
        System.Assert.isNull(
            getCasesQuery.SortCriterion,
            'SortCriterion should be null'
        );
        System.Assert.isNull(getCasesQuery.Recno, 'Recno should be null');
        System.Assert.isNull(
            getCasesQuery.CaseNumber,
            'CaseNumber should be null'
        );
        System.Assert.isNull(
            getCasesQuery.ExternalId,
            'ExternalId should be null'
        );
        System.Assert.isNull(getCasesQuery.Title, 'Title should be null');
        System.Assert.isNull(
            getCasesQuery.ArchiveCode,
            'ArchiveCode should be null'
        );
        System.Assert.isNull(
            getCasesQuery.ProjectNumber,
            'ProjectNumber should be null'
        );
        System.Assert.isNull(
            getCasesQuery.CategoryCode,
            'CategoryCode should be null'
        );
        System.Assert.isNull(getCasesQuery.LastDate, 'LastDate should be null');
        System.Assert.isNull(
            getCasesQuery.ContactReferenceNumber,
            'ContactReferenceNumber should be null'
        );
        System.Assert.isNull(
            getCasesQuery.ContactExternalId,
            'ContactExternalId should be null'
        );
        System.Assert.isNull(
            getCasesQuery.ContactRecnos,
            'ContactRecnos should be null'
        );
        System.Assert.isNull(
            getCasesQuery.SubArchive,
            'SubArchive should be null'
        );
        System.Assert.isNull(getCasesQuery.CaseType, 'CaseType should be null');
    }

    /**
     * @description Test `toJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see GetCasesQuery.toJson
     */
    @IsTest
    static void toJson() {
        String adContextUser = 'ADContextUser';
        Integer maxReturnedCases = 10;
        Integer page = 1;
        String sortCriterion = 'SortCriterion';
        String recno = 'recno:123';
        String caseNumber = 'CaseNumber';
        ExternalIdParameter externalId = new ExternalIdParameter('id', 'type');
        String title = 'Title';
        String archiveCode = 'ArchiveCode';
        String projectNumber = 'ProjectNumber';
        String categoryCode = 'CategoryCode';
        String lastDate = '2025-02-05T09:24:09.335Z';
        String contactReferenceNumber = 'ContactReferenceNumber';
        String contactExternalId = 'ContactExternalId';
        String contactRecnos = 'ContactRecnos';
        String subArchive = 'SubArchive';
        String caseType = 'CaseType';

        String expectedJsonString =
            '{"ADContextUser":"' +
            adContextUser +
            '","MaxReturnedCases":' +
            maxReturnedCases +
            ',"Page":' +
            page +
            ',"SortCriterion":"' +
            sortCriterion +
            '","Recno":"' +
            recno +
            '","CaseNumber":"' +
            caseNumber +
            '","ExternalId":' +
            externalId.toJson() +
            ',"Title":"' +
            title +
            '","ArchiveCode":"' +
            archiveCode +
            '","ProjectNumber":"' +
            projectNumber +
            '","CategoryCode":"' +
            categoryCode +
            '","LastDate":"' +
            lastDate +
            '","ContactReferenceNumber":"' +
            contactReferenceNumber +
            '","ContactExternalId":"' +
            contactExternalId +
            '","ContactRecnos":"' +
            contactRecnos +
            '","SubArchive":"' +
            subArchive +
            '","CaseType":"' +
            caseType +
            '"}';
        String actualJsonString;

        GetCasesQuery getCasesQueryDataType = new GetCasesQuery();
        getCasesQueryDataType.ADContextUser = adContextUser;
        getCasesQueryDataType.MaxReturnedCases = maxReturnedCases;
        getCasesQueryDataType.Page = page;
        getCasesQueryDataType.SortCriterion = sortCriterion;
        getCasesQueryDataType.Recno = recno;
        getCasesQueryDataType.CaseNumber = caseNumber;
        getCasesQueryDataType.ExternalId = externalId;
        getCasesQueryDataType.Title = title;
        getCasesQueryDataType.ArchiveCode = archiveCode;
        getCasesQueryDataType.ProjectNumber = projectNumber;
        getCasesQueryDataType.CategoryCode = categoryCode;
        getCasesQueryDataType.LastDate = lastDate;
        getCasesQueryDataType.ContactReferenceNumber = contactReferenceNumber;
        getCasesQueryDataType.ContactExternalId = contactExternalId;
        getCasesQueryDataType.ContactRecnos = contactRecnos;
        getCasesQueryDataType.SubArchive = subArchive;
        getCasesQueryDataType.CaseType = caseType;

        System.Test.startTest();
        actualJsonString = getCasesQueryDataType.toJson();
        System.Test.stopTest();

        System.Assert.areEqual(
            expectedJsonString,
            actualJsonString,
            'toJson should return a JSON string representation of the object.'
        );
    }

    /**
     * @description Test `fromJson` method.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see GetCasesQuery.toJson
     */
    @IsTest
    static void fromJson() {
        String adContextUser = 'ADContextUser';
        Integer maxReturnedCases = 10;
        Integer page = 1;
        String sortCriterion = 'SortCriterion';
        String recno = 'recno:123';
        String caseNumber = 'CaseNumber';
        ExternalIdParameter externalId = new ExternalIdParameter('id', 'type');
        String title = 'Title';
        String archiveCode = 'ArchiveCode';
        String projectNumber = 'ProjectNumber';
        String categoryCode = 'CategoryCode';
        String lastDate = '2025-02-05T09:24:09.335Z';
        String contactReferenceNumber = 'ContactReferenceNumber';
        String contactExternalId = 'ContactExternalId';
        String contactRecnos = 'ContactRecnos';
        String subArchive = 'SubArchive';
        String caseType = 'CaseType';

        GetCasesQuery getCasesQueryDataType = new GetCasesQuery();
        getCasesQueryDataType.ADContextUser = adContextUser;
        getCasesQueryDataType.MaxReturnedCases = maxReturnedCases;
        getCasesQueryDataType.Page = page;
        getCasesQueryDataType.SortCriterion = sortCriterion;
        getCasesQueryDataType.Recno = recno;
        getCasesQueryDataType.CaseNumber = caseNumber;
        getCasesQueryDataType.ExternalId = externalId;
        getCasesQueryDataType.Title = title;
        getCasesQueryDataType.ArchiveCode = archiveCode;
        getCasesQueryDataType.ProjectNumber = projectNumber;
        getCasesQueryDataType.CategoryCode = categoryCode;
        getCasesQueryDataType.LastDate = lastDate;
        getCasesQueryDataType.ContactReferenceNumber = contactReferenceNumber;
        getCasesQueryDataType.ContactExternalId = contactExternalId;
        getCasesQueryDataType.ContactRecnos = contactRecnos;
        getCasesQueryDataType.SubArchive = subArchive;
        getCasesQueryDataType.CaseType = caseType;

        String jsonString =
            '{"ADContextUser":"' +
            adContextUser +
            '","MaxReturnedCases":' +
            maxReturnedCases +
            ',"Page":' +
            page +
            ',"SortCriterion":"' +
            sortCriterion +
            '","Recno":"' +
            recno +
            '","CaseNumber":"' +
            caseNumber +
            '","ExternalId":' +
            externalId.toJson() +
            ',"Title":"' +
            title +
            '","ArchiveCode":"' +
            archiveCode +
            '","ProjectNumber":"' +
            projectNumber +
            '","CategoryCode":"' +
            categoryCode +
            '","LastDate":"' +
            lastDate +
            '","ContactReferenceNumber":"' +
            contactReferenceNumber +
            '","ContactExternalId":"' +
            contactExternalId +
            '","ContactRecnos":"' +
            contactRecnos +
            '","SubArchive":"' +
            subArchive +
            '","CaseType":"' +
            caseType +
            '"}';

        System.Test.startTest();
        GetCasesQuery deserializedGetCasesQueryDataType = GetCasesQuery.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areEqual(
            getCasesQueryDataType.ADContextUser,
            deserializedGetCasesQueryDataType.ADContextUser,
            'ADContextUser fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.MaxReturnedCases,
            deserializedGetCasesQueryDataType.MaxReturnedCases,
            'MaxReturnedCases fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.Page,
            deserializedGetCasesQueryDataType.Page,
            'Page fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.SortCriterion,
            deserializedGetCasesQueryDataType.SortCriterion,
            'SortCriterion fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.Recno,
            deserializedGetCasesQueryDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.CaseNumber,
            deserializedGetCasesQueryDataType.CaseNumber,
            'CaseNumber fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.ExternalId.toJson(),
            deserializedGetCasesQueryDataType.ExternalId.toJson(),
            'ExternalId fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.Title,
            deserializedGetCasesQueryDataType.Title,
            'Title fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with extra child.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see GetCasesQuery.toJson
     */
    @IsTest
    static void fromJsonWithExtraChild() {
        String adContextUser = 'ADContextUser';
        Integer maxReturnedCases = 10;
        Integer page = 1;
        String sortCriterion = 'SortCriterion';
        String recno = 'recno:123';
        String caseNumber = 'CaseNumber';
        ExternalIdParameter externalId = new ExternalIdParameter('id', 'type');
        String title = 'Title';
        String archiveCode = 'ArchiveCode';
        String projectNumber = 'ProjectNumber';
        String categoryCode = 'CategoryCode';
        String lastDate = '2025-02-05T09:24:09.335Z';
        String contactReferenceNumber = 'ContactReferenceNumber';
        String contactExternalId = 'ContactExternalId';
        String contactRecnos = 'ContactRecnos';
        String subArchive = 'SubArchive';
        String caseType = 'CaseType';

        GetCasesQuery getCasesQueryDataType = new GetCasesQuery();
        getCasesQueryDataType.ADContextUser = adContextUser;
        getCasesQueryDataType.MaxReturnedCases = maxReturnedCases;
        getCasesQueryDataType.Page = page;
        getCasesQueryDataType.SortCriterion = sortCriterion;
        getCasesQueryDataType.Recno = recno;
        getCasesQueryDataType.CaseNumber = caseNumber;
        getCasesQueryDataType.ExternalId = externalId;
        getCasesQueryDataType.Title = title;
        getCasesQueryDataType.ArchiveCode = archiveCode;
        getCasesQueryDataType.ProjectNumber = projectNumber;
        getCasesQueryDataType.CategoryCode = categoryCode;
        getCasesQueryDataType.LastDate = lastDate;
        getCasesQueryDataType.ContactReferenceNumber = contactReferenceNumber;
        getCasesQueryDataType.ContactExternalId = contactExternalId;
        getCasesQueryDataType.ContactRecnos = contactRecnos;
        getCasesQueryDataType.SubArchive = subArchive;
        getCasesQueryDataType.CaseType = caseType;

        String jsonString =
            '{"ADContextUser":"' +
            adContextUser +
            '","MaxReturnedCases":' +
            maxReturnedCases +
            ',"Page":' +
            page +
            ',"SortCriterion":"' +
            sortCriterion +
            '","Recno":"' +
            recno +
            '","CaseNumber":"' +
            caseNumber +
            '","ExternalId":' +
            externalId.toJson() +
            ',"Title":"' +
            title +
            '","ArchiveCode":"' +
            archiveCode +
            '","ProjectNumber":"' +
            projectNumber +
            '","CategoryCode":"' +
            categoryCode +
            '","LastDate":"' +
            lastDate +
            '","ContactReferenceNumber":"' +
            contactReferenceNumber +
            '","ContactExternalId":"' +
            contactExternalId +
            '","ContactRecnos":"' +
            contactRecnos +
            '","SubArchive":"' +
            subArchive +
            '","CaseType":"' +
            caseType +
            '","ExtraChild": "Extra"}';

        System.Test.startTest();
        GetCasesQuery deserializedGetCasesQueryDataType = GetCasesQuery.fromJson(
            jsonString
        );
        System.Test.stopTest();

        System.Assert.areNotEqual(
            null,
            deserializedGetCasesQueryDataType,
            'Deserialized object should not be null and should still get a valid GetCasesQuery object even with extra fields.'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.ADContextUser,
            deserializedGetCasesQueryDataType.ADContextUser,
            'ADContextUser fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.MaxReturnedCases,
            deserializedGetCasesQueryDataType.MaxReturnedCases,
            'MaxReturnedCases fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.Page,
            deserializedGetCasesQueryDataType.Page,
            'Page fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.SortCriterion,
            deserializedGetCasesQueryDataType.SortCriterion,
            'SortCriterion fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.Recno,
            deserializedGetCasesQueryDataType.Recno,
            'Recno fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.CaseNumber,
            deserializedGetCasesQueryDataType.CaseNumber,
            'CaseNumber fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.ExternalId.toJson(),
            deserializedGetCasesQueryDataType.ExternalId.toJson(),
            'ExternalId fields should be equal'
        );
        System.Assert.areEqual(
            getCasesQueryDataType.Title,
            deserializedGetCasesQueryDataType.Title,
            'Title fields should be equal'
        );
    }

    /**
     * @description Test `fromJson` method with malformed JSON and expect an exception to be thrown.
     *
     * @author Kenneth Soerensen <kenneth.sorensen@nav.no>, Nav
     * @since 0.1.0, February 2025
     * @see GetCasesQuery.toJson
     */
    @IsTest
    static void fromJsonAndThrowExceptionOnMalformedJson() {
        String jsonString = '{"MaxReturnedCases":10, "MalformedJson"}';

        String actualExceptionType = '';
        Boolean isExceptionThrown = false;
        System.Test.startTest();
        try {
            EstateParameter.fromJson(jsonString);
        } catch (Exception ex) {
            isExceptionThrown = true;
            actualExceptionType = ex.getTypeName();
        }
        System.Test.stopTest();

        System.Assert.isTrue(
            isExceptionThrown,
            'Expected to have an exception thrown.'
        );
        System.Assert.areEqual(
            'System.JSONException',
            actualExceptionType,
            'Expected exception type should be equal to actual exception type.'
        );
    }
}
