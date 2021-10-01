#location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'Out of the Easy',
                            author: 'Ruta Sepetys',
                            price: 10.99,
                            published_date: Date.new(2013, 2, 12))
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
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
end