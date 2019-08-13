class RemoteControl:
    def __init__(self):
        self.channels = ['hbo', 'cnn', 'ibn']
        self.index = -1

    def __iter__(self):
        return self

    def __next__(self):
        self.index += 1
        if self.index == len(self.channels):
            raise StopIteration
        else:
            return self.channels[self.index]


r = RemoteControl()
itr = iter(r)
i = 0
while i < len(r.channels):
    print(next(itr))
    i += 1

