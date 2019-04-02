Class {
	#name : #MSAbstractDirectionNavigationQueryStrategy,
	#superclass : #Object,
	#category : #'MooseSpec-Queries-Utils'
}

{ #category : #printing }
MSAbstractDirectionNavigationQueryStrategy class >> displayOn: aStream with: anAssociationStrategy [
	self subclassResponsibility
]

{ #category : #action }
MSAbstractDirectionNavigationQueryStrategy class >> query: anEntity with: anAssociationStrategy [
	^ self subclassResponsibility
]
