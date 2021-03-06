// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.viajes.entity;

import com.viajes.entity.Destination;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Destination_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Destination.entityManager;
    
    public static final List<String> Destination.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "code", "description");
    
    public static final EntityManager Destination.entityManager() {
        EntityManager em = new Destination().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Destination.countDestinations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Destination o", Long.class).getSingleResult();
    }
    
    public static List<Destination> Destination.findAllDestinations() {
        return entityManager().createQuery("SELECT o FROM Destination o", Destination.class).getResultList();
    }
    
    public static List<Destination> Destination.findAllDestinations(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Destination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Destination.class).getResultList();
    }
    
    public static Destination Destination.findDestination(Long id) {
        if (id == null) return null;
        return entityManager().find(Destination.class, id);
    }
    
    public static List<Destination> Destination.findDestinationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Destination o", Destination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Destination> Destination.findDestinationEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Destination o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Destination.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Destination.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Destination.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Destination attached = Destination.findDestination(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Destination.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Destination.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Destination Destination.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Destination merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
