#location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'Out of the Easy')
        described_class.new(author: 'Ruta Sepetys')
        described_class.new(price: 10.99)
        described_class.new(published_date: Date.new(2013, 2, 12))
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
        expect(subject.title).to be('Out of the Easy')
        expect(subject.author).to be('Ruta Sepetys')
        expect(subject.price).to be(10.99)
        expect(subject.published_date).to be(Date.new(2013, 2, 12))

    end

    it 'is not valid without a name' do
        subject.title = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without an author' do
        subject.author = nil
        expect(subject).not_to be_valid
    end
    
    it 'is not valid without a price' do
        subject.price = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid if price is not a numerical value' do
        subject.price = 'test_value'
        expect(subject).not_to be_valid
    end

    it 'is not valid without a published date' do
        subject.published_date = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid if published date is a string' do
        subject.published_date = 'test_string'
        expect(subject).not_to be_valid
    end

    it 'is not valid if published date is a numerical' do
        subject.published_date = 100
        expect(subject).not_to be_valid
    end
end