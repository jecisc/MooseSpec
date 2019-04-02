Class {
	#name : #MSIncomingNavigationQueryStrategy,
	#superclass : #MSAbstractDirectionNavigationQueryStrategy,
	#category : #'MooseSpec-Queries-Utils'
}

{ #category : #printing }
MSIncomingNavigationQueryStrategy class >> displayOn: aStream with: anAssociationStrategy [
	anAssociationStrategy displayIncomingOn: aStream
]

{ #category : #action }
MSIncomingNavigationQueryStrategy class >> query: anEntity with: anAssociationStrategy [
	^ anAssociationStrategy queryIncomingWith: anEntity
]
