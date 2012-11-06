require 'spec_helper'

describe Places::Country do
  class Country
    include Places::Country
  end

  let(:country) { Country.load_country('brazil') }

  it 'gets a country by name' do
    country.should be_kind_of Country
    country.name.should == 'Brasil'
    country.international_name.should == 'Brazil'
    country.demonym.should == 'brasileiro'
    country.female_demonym.should == 'brasileira'
    country.international_demonym.should == 'Brazilian'
  end

  it 'retrieves state data' do
    country.should have(27).states
    rio = country.state('RJ')
    rio.name.should == 'Rio de Janeiro'
    rio.acronym.should == 'RJ'
    rio.region.should == 'Sudeste'
  end

  it 'state retrieves city data' do
    rio = country.state('RJ')
    rio.should have(92).cities
    campos = rio.city('Campos dos Goytacazes')
    campos.name.should == 'Campos dos Goytacazes'
    campos.population.should == 463_731
    campos.urban_population.should == 418_725
    campos.area.should == 4026.712
    campos.should_not be_capital

    rio.city('Rio de Janeiro').should be_capital
  end
end
