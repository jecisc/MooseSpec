Class {
	#name : #MSLocalOutgoingNavigationQueryStrategy,
	#superclass : #MSAbstractDirectionNavigationQueryStrategy,
	#category : #'MooseSpec-Queries-Utils'
}

{ #category : #printing }
MSLocalOutgoingNavigationQueryStrategy class >> displayOn: aStream with: anAssociationStrategy [
	anAssociationStrategy displayLocalOutgoingOn: aStream
]

{ #category : #action }
MSLocalOutgoingNavigationQueryStrategy class >> query: anEntity with: anAssociationStrategy [
	^ anAssociationStrategy queryLocalOutgoingWith: anEntity
]
