Class {
	#name : #MSAbstractBrowser,
	#superclass : #ComposablePresenter,
	#category : #'MooseSpec-Core'
}

{ #category : #testing }
MSAbstractBrowser class >> isAbstract [
	^ self = MSAbstractBrowser
]

{ #category : #specs }
MSAbstractBrowser class >> title [
	^ self subclassResponsibility
]
