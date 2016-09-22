package com.jordiv.debatre

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class AuditTrailController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AuditTrail.list(params), model:[auditTrailCount: AuditTrail.count()]
    }

    def show(AuditTrail auditTrail) {
        respond auditTrail
    }

    def create() {
        respond new AuditTrail(params)
    }

    @Transactional
    def save(AuditTrail auditTrail) {
        if (auditTrail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (auditTrail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond auditTrail.errors, view:'create'
            return
        }

        auditTrail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'auditTrail.label', default: 'AuditTrail'), auditTrail.id])
                redirect auditTrail
            }
            '*' { respond auditTrail, [status: CREATED] }
        }
    }

    def edit(AuditTrail auditTrail) {
        respond auditTrail
    }

    @Transactional
    def update(AuditTrail auditTrail) {
        if (auditTrail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (auditTrail.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond auditTrail.errors, view:'edit'
            return
        }

        auditTrail.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'auditTrail.label', default: 'AuditTrail'), auditTrail.id])
                redirect auditTrail
            }
            '*'{ respond auditTrail, [status: OK] }
        }
    }

    @Transactional
    def delete(AuditTrail auditTrail) {

        if (auditTrail == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        auditTrail.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'auditTrail.label', default: 'AuditTrail'), auditTrail.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'auditTrail.label', default: 'AuditTrail'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
