enum ItemType { job, ask, comment, story, poll, pollopt }

ItemType itemTypeFromJson(String type) {
  switch (type) {
    case 'job':
      return ItemType.job;
    case 'ask':
      return ItemType.ask;
    case 'comment':
      return ItemType.comment;
    case 'poll':
      return ItemType.poll;
    case 'pollopt':
      return ItemType.pollopt;
    case 'story':
    case 'link':
    default:
      return ItemType.story;
  }
}
