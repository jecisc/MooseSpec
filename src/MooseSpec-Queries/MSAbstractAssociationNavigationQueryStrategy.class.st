Class {
	#name : #MSAbstractAssociationNavigationQueryStrategy,
	#superclass : #Object,
	#category : #'MooseSpec-Queries-Utils'
}

{ #category : #printing }
MSAbstractAssociationNavigationQueryStrategy >> displayIncomingOn: aStream [
	self subclassResponsibility
]

{ #category : #printing }
MSAbstractAssociationNavigationQueryStrategy >> displayOutgoingOn: aStream [
	self subclassResponsibility
]

{ #category : #action }
MSAbstractAssociationNavigationQueryStrategy >> queryIncomingWith: anEntity [
	^ self subclassResponsibility
]

{ #category : #action }
MSAbstractAssociationNavigationQueryStrategy >> queryLocalIncomingWith: anEntity [
	^ self subclassResponsibility
]

{ #category : #action }
MSAbstractAssociationNavigationQueryStrategy >> queryLocalOutgoingWith: anEntity [
	^ self subclassResponsibility
]

{ #category : #action }
MSAbstractAssociationNavigationQueryStrategy >> queryOutgoingWith: anEntity [
	^ self subclassResponsibility
]
