require "spec_helper"

describe Cell do
  let(:cell) { Cell.new(:A, 1) }

  it "is initialized with a column and row" do
    expect(cell).to be_a Cell
  end

  it "has a reader for column and row" do
    expect(cell.column).to eq :A
    expect(cell.row).to eq 1
  end

  it "starts off with no owner" do
    expect(cell.owner).to be_nil
  end

  describe "#set_owner" do
    it "should set the owner if the cell is empty" do
      cell.set_owner(:player_1)

      expect(cell.owner).to eq :player_1
    end

    it "should not alter the owner of the cell if an owner is already defined" do
      cell.set_owner(:player_1)
      cell.set_owner(:player_2)

      expect(cell.owner).to eq :player_1
    end
  end

  describe "#empty" do
    it "should return true if the owner has not been set" do
      expect(cell.empty?).to eq true
    end

    it "should return false if the owner has been set" do
      cell.set_owner(:player_1)

      expect(cell.empty?).to eq false
    end
  end
end
