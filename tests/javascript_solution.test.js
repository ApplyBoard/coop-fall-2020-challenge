const EventSourcer = require('../solution_javascript');

test('test add', () => {
  let sourcer = new EventSourcer();

  sourcer.add(2);
  sourcer.add(5);

  expect(sourcer.value).toEqual(7);
});

test('test subtract', () => {
  let sourcer = new EventSourcer();

  sourcer.subtract(2);
  sourcer.subtract(5);

  expect(sourcer.value).toEqual(-7);
});

test('test undo', () => {
  let sourcer = new EventSourcer();

  sourcer.add(2);
  sourcer.add(2);
  sourcer.add(2);
  sourcer.add(2);
  sourcer.undo();

  expect(sourcer.value).toEqual(6);
});

test('test redo', () => {
  let sourcer = new EventSourcer();

  sourcer.add(2);
  sourcer.add(2);
  sourcer.add(2);
  sourcer.add(2);
  sourcer.undo();

  expect(sourcer.value).toEqual(6);
});

test('test redo', () => {
  let sourcer = new EventSourcer();

  sourcer.add(5);
  sourcer.add(5);
  sourcer.add(5);
  sourcer.undo();
  sourcer.undo();
  sourcer.add(1);
  sourcer.redo();

  expect(sourcer.value).toEqual(11);
});

test('test bulk undo', () => {
  let sourcer = new EventSourcer();

  sourcer.add(1);
  sourcer.add(2);
  sourcer.add(3);
  sourcer.add(4);
  sourcer.add(5);
  sourcer.bulk_undo(3);

  expect(sourcer.value).toEqual(3);
});

test('test bulk redo', () => {
  let sourcer = new EventSourcer();

  sourcer.add(1);
  sourcer.add(1);
  sourcer.add(1);
  sourcer.add(1);
  sourcer.add(1);
  sourcer.undo();
  sourcer.undo();
  sourcer.undo();
  sourcer.undo();
  sourcer.bulk_redo(4)

  expect(sourcer.value).toEqual(5);
});

test('test undo no actions', () => {
  let sourcer = new EventSourcer();

  sourcer.undo();

  expect(sourcer.value).toEqual(0);
});

test('test redo with no redo step', () => {
  let sourcer = new EventSourcer();

  sourcer.redo();

  expect(sourcer.value).toEqual(0);
});

test('test bulk undo overstep', () => {
  let sourcer = new EventSourcer();

  sourcer.add(5);
  sourcer.add(5);
  sourcer.add(5);
  sourcer.add(5);
  sourcer.subtract(5);
  sourcer.bulk_undo(5);

  expect(sourcer.value).toEqual(0);
});

test('test bulk redo overstep', () => {
  let sourcer = new EventSourcer();

  sourcer.add(5);
  sourcer.add(5);
  sourcer.add(5);
  sourcer.add(5);
  sourcer.add(5);
  sourcer.undo();
  sourcer.undo();
  sourcer.undo();
  sourcer.bulk_redo(5);

  expect(sourcer.value).toEqual(25);
});
