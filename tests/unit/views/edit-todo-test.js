/* jshint expr:true */

import { expect } from 'chai';
import {
  describeModule,
  it
} from 'ember-mocha';

beforeEach(function () {
  this.sandbox = sinon.sandbox.create();
});

afterEach(function () {
  this.sandbox.restore();
});

describeModule(
  'view:edit-todo',
  'EditTodoView',
  {
    // Specify the other units that are required for this test.
    // needs: ['controller:foo']
  },

  function() {
    // Replace this with your real tests.
    it('exists', function() {
      var view = this.subject();
      expect(view).to.be.ok;
    });

    it('grabs the focus', function () {
      var view = this.subject();

      var jQuerySpy = {focus: this.sandbox.spy()};
      var jQueryStub = this.sandbox.stub(view, '$').returns(jQuerySpy);

      view.didInsertElement();

      expect(jQuerySpy).to.have.been.called;
    });
  }
);
