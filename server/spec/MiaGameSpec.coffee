class PlayerStub
	willJoinRound: ->

mia = require '../lib/miaGame'

describe 'Mia Game', ->
	miaGame = player1 = player2 = null

	beforeEach ->
		miaGame = mia.createGame()
		this.addMatchers
			toHavePlayer: (player) -> this.actual.hasPlayer player

	it 'accepts players to register', ->
		player1 = {}
		player2 = {}
		expect(miaGame.players).not.toHavePlayer player1
		miaGame.registerPlayer player1
		expect(miaGame.players).toHavePlayer player1

		expect(miaGame.players).not.toHavePlayer player2
		miaGame.registerPlayer player2
		expect(miaGame.players).toHavePlayer player2

	it 'calls permute on current round', ->
		spyOn miaGame.currentRound, 'permute'
		miaGame.permuteCurrentRound()
		expect(miaGame.currentRound.permute).toHaveBeenCalled()

	describe 'new round', ->
		beforeEach ->
			miaGame.registerPlayer player1 = new PlayerStub
			miaGame.registerPlayer player2 = new PlayerStub

		it 'should broadcast new round', ->
			spyOn player1, 'willJoinRound'
			miaGame.newRound()
			expect(player1.willJoinRound).toHaveBeenCalled()

		it 'should have player for current round when she wants to', ->
			spyOn(player1, 'willJoinRound').andReturn(true)
			miaGame.newRound()
			expect(miaGame.currentRound).toHavePlayer player1

		it 'should not have player for current round when she does not want to', ->
			spyOn(player1, 'willJoinRound').andReturn(false)
			miaGame.newRound()
			expect(miaGame.currentRound).not.toHavePlayer player1

		it 'should permute the current round when setting up a new round', ->
			spyOn miaGame, 'permuteCurrentRound'
			miaGame.newRound()
			expect(miaGame.permuteCurrentRound).toHaveBeenCalled()

# TODO Write abstraction for rnd that can be mocked

describe 'permutation', ->
	list1 = list2 = {}

	beforeEach ->
		this.addMatchers

			toHaveEqualLength: (other) ->
				this.actual.length == other.length

			toEqualArray: (other) ->
				return false unless this.actual.length == other.length
				for key, value of other
					return false unless this.actual[key] == value
				true

		list1 = new mia.classes.PlayerList
		list2 = new mia.classes.PlayerList
		for value in [1..10]
			list1.add value
			list2.add value

	it 'should have same number of objects after permutation', ->
			expect(list1.players).toEqualArray(list2.players)
			list1.permute
			expect(list1.players).toHaveEqualLength(list2.players)

	#TODO
	xit 'should not have same order of objects after permutation', ->
			expect(list1.players).toEqualArray(list2.players)
			list1.permute
			expect(list1.players).not.toEqualArray(list2.players)
