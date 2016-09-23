package com.jordiv.debatre

import org.bson.types.ObjectId

class Debate {
    static auditable = true
    ObjectId id
    Date dateCreated
    Date lastUpdated
    User author
    String title
    String content
    List<Comment> comments

    static mapping = {
        index content:"text"
    }

    static constraints = {
        title maxSize: 140
    }
}
