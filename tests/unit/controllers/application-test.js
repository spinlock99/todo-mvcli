/* jshint expr:true */
import { expect } from 'chai';
import {
  describeModule,
  it
} from 'ember-mocha';
import Ember from'ember';
import startApp from '../../helpers/start-app';

var App;
var store;
var sandbox;

before(function() {
  App = startApp();
  store = App.__container__.lookup('store:main');
});

beforeEach(function() {
  sandbox = sinon.sandbox.create();
});

after(function() {
  Ember.run(App, App.destroy);
});

afterEach(function() {
  sandbox.restore();
});

describeModule(
  'controller:application',
  'ApplicationController',
  {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  },
  function() {
    // Replace this with your real tests.
    it('exists', function() {
      var controller = this.subject();
      expect(controller).to.be.ok;
    });
    it('doesn\'t save a record without a title', function() {
      var controller = this.subject();
      var spy = sinon.spy(controller, 'set');
      var createRecordStub = {save: sinon.spy()};
      var storeStub = {createRecord: function () { return(createRecordStub); }};
      controller.set('store', storeStub);

      controller.set('newTitle', 'something');
      controller.send('createTodo');

      expect(controller.set).to.not.have.been.called;

      //expect(controller.get('newTitle')).to.be.undefined;
    });
  }
);
