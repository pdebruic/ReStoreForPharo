"
ReStore
¬©2020 John Aspinall
https://github.com/rko281/ReStore
"
Class {
	#name : #SSWReStoreDependentOwnedCacheDictionaryTest,
	#superclass : #SSWReStoreRelatedOwnedCacheDictionaryTest,
	#category : #'SSW ReStore Tests'
}

{ #category : #helpers }
SSWReStoreDependentOwnedCacheDictionaryTest >> _testComponentExistenceOnDependency: component [

	"Private - collection is dependent at this level, so replaced/removed/cascade-deleted component should no longer exist"

	self assert: (component _dbProxyIn: reStore ifNone: [nil]) isNil.

	reStore simulateReconnect.
	self assert: ((component class storedInstancesIn: reStore) detect: [ :each | each name = component name] ifNone: [nil]) isNil
]

{ #category : #accessing }
SSWReStoreDependentOwnedCacheDictionaryTest >> componentDefinition [

	^(Dictionary of: #key -> GenericOwnedTest dependent)
]