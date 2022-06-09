using example.helloworld.srv.AuthorsService from '../../srv/authors';

annotate AuthorsService.Authors with @(UI : {
    HeaderInfo          : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'author',
        TypeNamePlural : 'authors',
        Title          : {
            $Type : 'UI.DataField',
            Value : '{sFirstName} {sLastName}',
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : sNotes,
        },
    },
    LineItem            : [
        {Value : sFirstName},
        {Value : sLastName},
        {Value : sNotes},
    ],
    Facets              : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'AllgemeineDaten',
            Label  : '{i18n>AllgemeineDaten}',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'DetailDaten',
                    Label  : '{i18n>DetailDaten}',
                    Target : '@UI.FieldGroup#General'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'AdminDaten',
                    Label  : '{i18n>AdminDaten}',
                    Target : '@UI.FieldGroup#Admin'
                },
            ]
        },
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'Adressuebersicht',
            Label  : '{i18n>Adressuebersicht}',
            Target : 'to_Books/@UI.LineItem'
        }
    ],
    FieldGroup #General : {Data : [
        {Value : sFirstName},
        {Value : sLastName},
        {Value : sNotes},
    ]},
    FieldGroup #Admin   : {Data : [
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
    ]}
}) {
    @UI.Hidden        : true
    sId;
};

annotate AuthorsService.Books with @(UI : {
    HeaderInfo          : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'author',
        TypeNamePlural : 'authors',
        Title          : {
            $Type : 'UI.DataField',
            Value : sTitle,
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : sNotes,
        },
    },
    LineItem            : [
        {Value : sTitle},
        {Value : sNotes},
    ],
    Facets              : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'AllgemeineDaten',
            Label  : '{i18n>AllgemeineDaten}',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'DetailDaten',
                    Label  : '{i18n>DetailDaten}',
                    Target : '@UI.FieldGroup#General'
                },
            ]
        },
    ],
    FieldGroup #General : {Data : [
        {Value : sTitle},
        {Value : sNotes},
    ]},
    FieldGroup #Admin   : {Data : [
        {Value : createdBy},
        {Value : createdAt},
        {Value : modifiedBy},
        {Value : modifiedAt}
    ]}
}) {
    @UI.Hidden        : true
    sId;
};