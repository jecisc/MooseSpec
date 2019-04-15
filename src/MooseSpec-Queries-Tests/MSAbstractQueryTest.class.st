Class {
	#name : #MSAbstractQueryTest,
	#superclass : #MSTestCase,
	#instVars : [
		'model',
		'query'
	],
	#category : #'MooseSpec-Queries-Tests-Core'
}

{ #category : #testing }
MSAbstractQueryTest class >> isAbstract [
	^ self = MSAbstractQueryTest
]

{ #category : #testing }
MSAbstractQueryTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
MSAbstractQueryTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #running }
MSAbstractQueryTest >> setUp [
	super setUp.
	model
		ifNil: [ model := MooseModel new.
			MoosePharoImporterTask new
				factory: SmalltalkMetamodelFactory;
				importerClass: SmalltalkImporter;
				model: model;
				addFromPackageNamed: #'Moose-TestResources-LAN';
				run ]
]

{ #category : #tests }
MSAbstractQueryTest >> testDisplayOn [
	self subclassResponsibility
]

{ #category : #tests }
MSAbstractQueryTest >> testRunOn [
	self subclassResponsibility
]
