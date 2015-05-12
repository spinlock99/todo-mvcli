/* jshint expr:true */

import { expect } from 'chai';
import { describeModule, it } from 'ember-mocha';

var sandbox;

beforeEach(function () {
  sandbox = sinon.sandbox.create();
});

afterEach(function () {
  sandbox.restore();
});

describeModule(
  'view:edit-todo',
  'EditTodoView',

  function() {
    it('grabs the focus', function () {
      var view = this.subject();

      var focusSpy = sandbox.spy();
      var jQuerySpy = {focus: focusSpy};
      var jQueryStub = sandbox.stub(view, '$').returns(jQuerySpy);

      view.didInsertElement();

      expect(focusSpy.callCount).to.eq(1);
      expect(focusSpy).to.not.have.been.calledTwice;
    });
  }
);
