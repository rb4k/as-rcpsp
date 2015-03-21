#encoding: UTF-8

require 'spec_helper'

describe "Rcpsps" do

  subject { page }

  shared_examples_for "all pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "User page" do
    before { visit user_path }
    let(:heading) { 'Alle Mitarbeiter' }
    let(:page_title) { '' }

    it_should_behave_like "all pages"
    it { should_not have_selector 'title', text: '| Start' }
  end

  describe "Procedure page" do
    before { visit procedure_path }
    let(:heading) { 'Übersicht der Vorgänge' }
    let(:page_title) { '' }

    it_should_behave_like "all pages"

  end

  describe "Procedure_procedure page" do
    before { visit procedure_procedure_path }
    let(:heading) { 'Übersicht der Relationen zwischen den Vorgängen' }
    let(:page_title) { '' }

    it_should_behave_like "all pages"
  end

  describe "Resource page" do
    before { visit resource_path }
    let(:heading) { 'Übersicht der Ressourcen' }
    let(:page_title) { '' }

    it_should_behave_like "all pages"
  end

  describe "Procedure_resource page" do
    before { visit procedure_resource_path }
    let(:heading) { 'Übersicht der Zuordnung der Vorgänge zu den Ressourcen' }
    let(:page_title) { '' }

    it_should_behave_like "all pages"
  end

end