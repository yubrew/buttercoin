BD = require('bigdecimal')

Q = require("q")

operations = require('../lib/operations')

Buttercoin = require('../lib/buttercoin')
TestHelper = require('./test_helper')

describe 'TradeEngine', ->
  beforeEach =>
    TestHelper.clean_state_sync

  afterEach =>
    TestHelper.clean_state_sync

  it 'can initialize', (finish) ->
    butter = new Buttercoin()

    butter.api.start {port: 3060}, () =>
      butter.api.receive_message( [operations.ADD_DEPOSIT, {'account': 'Peter', 'password': 'foo', 'currency': 'USD', 'amount': 200.0}] )
      finish()
