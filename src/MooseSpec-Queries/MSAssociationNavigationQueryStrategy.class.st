Class {
	#name : #MSAssociationNavigationQueryStrategy,
	#superclass : #MSAbstractAssociationNavigationQueryStrategy,
	#instVars : [
		'associations'
	],
	#category : #'MooseSpec-Queries-Utils'
}

{ #category : #'instance creation' }
MSAssociationNavigationQueryStrategy class >> with: aFamixClass [
	^ self new
		associations: {aFamixClass};
		yourself
]

{ #category : #'instance creation' }
MSAssociationNavigationQueryStrategy class >> withAll: aCollection [
	^ self new
		associations: aCollection;
		yourself
]

{ #category : #accessing }
MSAssociationNavigationQueryStrategy >> associations [
	^ associations
]

{ #category : #accessing }
MSAssociationNavigationQueryStrategy >> associations: anObject [
	associations := anObject
]

{ #category : #printing }
MSAssociationNavigationQueryStrategy >> displayIncomingOn: aStream [
	"The condition is not really needed since the generated script of one branch will be valid all the time, but it is present to print a nicer script to the user."

	self associations size = 1
		ifTrue: [ aStream
				<< '(entity queryIncoming: ';
				print: self associations anyOne;
				<< ') opposites' ]
		ifFalse: [ aStream << '({ '.
			self associations do: [ :asso | aStream print: asso ] separatedBy: [ aStream << ' . ' ].
			aStream << ' } flatCollect: [ :association | (entity queryIncoming: association) opposites ])' ]
]

{ #category : #printing }
MSAssociationNavigationQueryStrategy >> displayLocalIncomingOn: aStream [
	"The condition is not really needed since the generated script of one branch will be valid all the time, but it is present to print a nicer script to the user."

	self associations size = 1
		ifTrue: [ aStream
				<< '(entity queryLocalIncoming: ';
				print: self associations anyOne;
				<< ') opposites' ]
		ifFalse: [ aStream << '({ '.
			self associations
				do: [ :asso | aStream print: asso ]
				separatedBy: [ aStream << ' . ' ].
			aStream
				<<
					' } flatCollect: [ :association | (entity queryLocalIncoming: association) opposites ])' ]
]

{ #category : #printing }
MSAssociationNavigationQueryStrategy >> displayLocalOutgoingOn: aStream [
	"The condition is not really needed since the generated script of one branch will be valid all the time, but it is present to print a nicer script to the user."

	self associations size = 1
		ifTrue: [ aStream
				<< 'entity queryLocalOutgoing: ';
				print: self associations anyOne;
				<< ') opposites' ]
		ifFalse: [ aStream << '({ '.
			self associations
				do: [ :asso | aStream print: asso ]
				separatedBy: [ aStream << ' . ' ].
			aStream
				<<
					' } flatCollect: [ :association | (entity queryLocalOutgoing: association) opposites ])' ]
]

{ #category : #printing }
MSAssociationNavigationQueryStrategy >> displayOutgoingOn: aStream [
	"The condition is not really needed since the generated script of one branch will be valid all the time, but it is present to print a nicer script to the user."

	self associations size = 1
		ifTrue: [ aStream
				<< 'entity queryOutgoing: ';
				print: self associations anyOne;
				<< ') opposites' ]
		ifFalse: [ aStream << '({ '.
			self associations do: [ :asso | aStream print: asso ] separatedBy: [ aStream << ' . ' ].
			aStream << ' } flatCollect: [ :association | (entity queryOutgoing: association) opposites ])' ]
]

{ #category : #action }
MSAssociationNavigationQueryStrategy >> queryIncomingWith: anEntity [
	^ self associations flatCollect: [ :each | (anEntity queryIncoming: each) opposites ]
]

{ #category : #action }
MSAssociationNavigationQueryStrategy >> queryLocalIncomingWith: anEntity [
	^ self associations flatCollect: [ :each | (anEntity queryLocalIncoming: each) opposites ]
]

{ #category : #action }
MSAssociationNavigationQueryStrategy >> queryLocalOutgoingWith: anEntity [
	^ self associations
		flatCollect: [ :each | (anEntity queryLocalOutgoing: each) opposites ]
]

{ #category : #action }
MSAssociationNavigationQueryStrategy >> queryOutgoingWith: anEntity [
	^ self associations flatCollect: [ :each | (anEntity queryOutgoing: each) opposites ]
]
