require "spec_helper"

shared_examples_for "globalizable" do |factory_name|
  let(:record) { create(factory_name) }
  let(:field) { record.translated_attribute_names.first }

  describe "Fallbacks" do
    before do
      allow(I18n).to receive(:available_locales).and_return(%i[ar de en es fr])

      record.update_attribute(field, "In English")

      { es: "En español", de: "Deutsch" }.each do |locale, text|
        Mobility.with_locale(locale) do
          record.translated_attribute_names.each do |attribute|
            record.update_attribute(attribute, record.send(attribute))
          end

          record.update_attribute(field, text)
        end
      end
    end

    after do
      allow(I18n).to receive(:available_locales).and_call_original
      allow(I18n.fallbacks).to receive(:[]).and_call_original
    end

    context "With a defined fallback" do
      before do
        allow(I18n.fallbacks).to receive(:[]).and_return([:fr, :es])
      end

      it "Falls back to the defined fallback" do
        Mobility.with_locale(:fr) do
          expect(record.send(field)).to eq "En español"
        end
      end
    end

    context "Without a defined fallback" do
      before do
        allow(I18n.fallbacks).to receive(:[]).and_return([:fr])
      end

      it "Falls back to the first available locale" do
        Mobility.with_locale(:fr) do
          expect(record.send(field)).to eq "Deutsch"
        end
      end
    end
  end
end
