package com.jordiv.debatre

import org.bson.types.ObjectId

class Comment {
    ObjectId id
    User author
    Debate debate
    String content

    static constraints = {
    }
}
