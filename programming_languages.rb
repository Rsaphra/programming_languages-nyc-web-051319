require 'pry'

def get_hash
  languages = {
  :oo => {
    :ruby => {
      :type => "interpreted"
    },
    :javascript => {
      :type => "interpreted"
    },
    :python => {
      :type => "interpreted"
    },
    :java => {
      :type => "compiled"
    }
  },
  :functional => {
    :clojure => {
      :type => "compiled"
    },
    :erlang => {
      :type => "compiled"
    },
    :scala => {
      :type => "compiled"
    },
    :javascript => {
      :type => "interpreted"
    }

  }
}
end

def add_language_style(languages, style)
  languages.each do |language_key, language_value|
    language_value.store(:style, [style])
  end
  #binding.pry
end

def merge_hashes(oo_languages, functional_languages)
  oo_languages = add_language_style(oo_languages, :oo)
  functional_languages = add_language_style(functional_languages, :functional)
  merged_hash = oo_languages.merge(functional_languages)
  #binding.pry
  merged_hash
end

def reformat_javascript(languages)
  style = languages[:javascript][:style]
  new_style = style.push(:oo)
  languages[:javascript][:style] = new_style
  languages
end

##returns an array with all the hashes under the basis
def collect_hashes(data, basis)
  language_list = data[basis]
  language_list
end

def reformat_languages(languages)
  new_hash = {}
  oo_languages = collect_hashes(languages, :oo)
  functional_languages = collect_hashes(languages, :functional)
  new_hash = merge_hashes(oo_languages, functional_languages)
  new_hash = reformat_javascript(new_hash)
  new_hash
end
