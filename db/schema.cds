namespace example.helloworld.db;

using {managed} from '@sap/cds/common';


entity Authors : managed {
        @title         : 'Author Id'
        @Core.Computed : true
    key sId        : UUID;
        @title         : 'Firstname'
        @mandatory
        sFirstName : String not null;
        @title         : 'Lastname'
        @mandatory
        sLastName  : String not null;
        @title         : 'Notes'
        sNotes     : String;
        @title         : 'Book'
        to_Books   : Composition of many Books
                         on to_Books.to_Authors.sId = sId;
}

entity Books : managed {
        @title         : 'Book Id'
        @Core.Computed : true
    key sId        : UUID;
        @title         : 'Title'
        @mandatory
        sTitle     : String not null;
        @title         : 'Notes'
        sNotes     : String;
        @title         : 'Author'
        to_Authors : Composition of one Authors;
}
