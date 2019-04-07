Class {
	#name : #MSLocalIncomingNavigationQueryStrategy,
	#superclass : #MSAbstractDirectionNavigationQueryStrategy,
	#category : #'MooseSpec-Queries-Utils'
}

{ #category : #action }
MSLocalIncomingNavigationQueryStrategy class >> displayOn: aStream with: anAssociationStrategy [
	anAssociationStrategy displayLocalIncomingOn: aStream
]

{ #category : #action }
MSLocalIncomingNavigationQueryStrategy class >> query: anEntity with: anAssociationStrategy [
	^ anAssociationStrategy queryLocalIncomingWith: anEntity
]
