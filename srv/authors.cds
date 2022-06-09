using {example.helloworld.db as helloworld_db} from '../db/schema';

namespace example.helloworld.srv;

service AuthorsService @(path : '/authors-srv') {
    entity Authors as select from helloworld_db.Authors;
    entity Books   as select from helloworld_db.Books;
}

annotate AuthorsService.Authors with @(Capabilities.InsertRestrictions : {Insertable : true, });

// annotate AuthorsService.Authors with @fiori.draft.enabled;
// annotate AuthorsService.Authors with @odata.draft.enabled;
