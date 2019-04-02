Class {
	#name : #MSOutgoingNavigationQueryStrategy,
	#superclass : #MSAbstractDirectionNavigationQueryStrategy,
	#category : #'MooseSpec-Queries-Utils'
}

{ #category : #printing }
MSOutgoingNavigationQueryStrategy class >> displayOn: aStream with: anAssociationStrategy [
	anAssociationStrategy displayOutgoingOn: aStream
]

{ #category : #action }
MSOutgoingNavigationQueryStrategy class >> query: anEntity with: anAssociationStrategy [
	^ anAssociationStrategy queryOutgoingWith: anEntity
]
